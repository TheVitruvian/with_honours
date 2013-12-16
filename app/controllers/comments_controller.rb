class CommentsController < ApplicationController
  
  before_filter :authenticate_user_or_company, except: [:index, :show]

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
    @comment = Comment.find(params[:id])
    authorize! :edit, @comment
  end

  def update
    @comment = Comment.find(params[:id])
    authorize! :update, @comment

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to Question.find(params[:question_id]), notice: 'Comment was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def create
    @comment = Comment.new(params[:comment])
    authorize! :create, Comment
    @comment.answer_id = Answer.find(params[:answer_id]).id

    @comment.owner_id = current_agent.id
    @comment.owner_type = current_agent.class.to_s
    respond_to do |format|
      if @comment.save
        format.html { redirect_to Question.find(params[:question_id]), notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to @question, alert: 'Comment cannot be blank.' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to question_url(params[:question_id]) }
      format.json { head :no_content }
    end
  end

  def vote
    #check if already voted
    previous_vote_check = CommentVote.where("owner_id=? AND owner_type=?", current_agent.id, current_agent.class.to_s)[0]
    comment = Comment.find(params[:id])
    
    # alter vote according to who is voting 
    vote = WEIGHTED_SCORE*(params[:vote].to_i) if current_agent.class.to_s == "Company" || current_agent.role == "mentor" else vote = params[:vote].to_i

    #alter make or destroy record
    if previous_vote_check.present?
      remove_from_comment_cache(previous_vote_check.vote, comment)
      existing_vote_alter_or_destroy(previous_vote_check, vote, comment)
    end

    if previous_vote_check.blank?
      make_new_comment_vote(comment, vote)
    end
    redirect_to question_path(params[:question_id])
  end

  private

  def make_new_comment_vote(comment, vote)
    comment_vote = CommentVote.new
    comment_vote.owner_id = current_agent.id
    comment_vote.owner_type = current_agent.class.to_s
    comment_vote.comment_id = comment.id
    comment_vote.vote = vote
    add_to_comment_cache(vote, comment)
    comment_vote.save
  end

  def existing_vote_alter_or_destroy(previous_vote, current_vote, comment)
    if previous_vote.vote == current_vote
      previous_vote.destroy    
    else
      previous_vote.vote = current_vote
      previous_vote.save
      add_to_comment_cache(current_vote, comment)
    end
  end

  def remove_from_comment_cache(previous_vote, comment)
    if previous_vote <0 then comment.down_votes_count -= previous_vote else comment.up_votes_count -= previous_vote end
    comment.owner.comments_score -= previous_vote
    comment.owner.save
    comment.save
  end

  def add_to_comment_cache(vote, comment)
    if vote <0 then comment.down_votes_count += vote else comment.up_votes_count += vote end
    comment.owner.comments_score += vote
    comment.owner.save
    comment.save 
  end
end