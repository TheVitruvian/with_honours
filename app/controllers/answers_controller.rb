class AnswersController < ApplicationController

  before_filter :authenticate_user_or_company

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    authorize! :edit, @answer
  end

  def update
    @answer = Answer.find(params[:id])
    authorize! :update, @answer

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to Question.find(params[:question_id]), notice: 'Comment was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to question_url(params[:question_id]) }
      format.json { head :no_content }
    end
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(params[:answer])
    @answer.question_id = @question.id
    @answer.owner_id = current_agent.id
    @answer.owner_type = current_agent.class.to_s
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @question, notice: 'Answer was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def vote
    #check if already voted
    previous_vote_check = AnswerVote.where("owner_id=? AND owner_type=?", current_agent.id, current_agent.class.to_s)[0]
    answer = Answer.find(params[:id])
    
    # alter vote according to who is voting 
    vote = WEIGHTED_SCORE*(params[:vote].to_i) if current_agent.class.to_s == "Company" || current_agent.role == "mentor" else vote = params[:vote].to_i

    #alter make or destroy record
    if previous_vote_check.present?
      remove_from_answer_cache(previous_vote_check.vote, answer)
      existing_vote_alter_or_destroy(previous_vote_check, vote, answer)
    end

    if previous_vote_check.blank?
      make_new_answer_vote(answer, vote)
    end
    redirect_to question_path(params[:question_id])
  end

  private

  def make_new_answer_vote(answer, vote)
    answer_vote = AnswerVote.new
    answer_vote.owner_id = current_agent.id
    answer_vote.owner_type = current_agent.class.to_s
    answer_vote.answer_id = answer.id
    answer_vote.vote = vote
    add_to_answer_cache(vote, answer)
    answer_vote.save
  end

  def existing_vote_alter_or_destroy(previous_vote, current_vote, answer)
    if previous_vote.vote == current_vote
      previous_vote.destroy    
    else
      previous_vote.vote = current_vote
      previous_vote.save
      add_to_answer_cache(current_vote, answer)
    end
  end

  def remove_from_answer_cache(previous_vote, answer)
    if previous_vote <0 then answer.down_votes_count -= previous_vote else answer.up_votes_count -= previous_vote end
    answer.save
  end

  def add_to_answer_cache(vote, answer)
    if vote <0 then answer.down_votes_count += vote else answer.up_votes_count += vote end
    answer.save 
  end
end