class QuestionsController < ApplicationController

  WEIGHTED_SCORE = 20
  
  before_filter :authenticate_user_or_company, except: [:index, :show]

  def index
    @questions = Question.order("hotness DESC")
  end

  def new
    authorize! :create, Question
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(:up_votes_count, :down_votes_count).reverse

    authorize! :read, @question
    @current_agent = current_agent
  end

  def create
    authorize! :create, Question
    @question = Question.new(params[:question])
    @question.owner_id = current_agent.id
    @question.owner_type = current_agent.class.to_s
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @question = Question.find(params[:id])
    authorize! :edit, @question
  end

  def update
    @question = Question.find(params[:id])
    authorize! :update, @question

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @question = Question.find(params[:id])
    authorize! :destroy, @question
    @question.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  def vote
    #check if already voted
    question = Question.find(params[:id])
    previous_vote_check = QuestionVote.where("owner_id=? AND owner_type=? AND question_id=?", current_agent.id, current_agent.class.to_s, question.id)[0]
    # alter vote according to who is voting  
    if params[:vote] == "up" 
      vote = 1
    else
      vote = -1
    end

    vote = WEIGHTED_SCORE*(vote) if current_agent.class.to_s == "Company" || current_agent.role == "mentor"

    #alter make or destroy record
    if previous_vote_check.present?
      remove_from_question_cache(previous_vote_check.vote, question)
      existing_vote_alter_or_destroy(previous_vote_check, vote, question)
    end

    if previous_vote_check.blank?
      make_new_question_vote(question, vote)
    end
    # return to index or show
    if !!params[:index]
      redirect_to root_url
    else
      redirect_to question_path
    end
  end

  private

  def make_new_question_vote(question, vote)
    question_vote = QuestionVote.new
    question_vote.owner_id = current_agent.id
    question_vote.owner_type = current_agent.class.to_s
    question_vote.question_id = question.id
    question_vote.vote = vote
    add_to_question_cache(vote, question)
    question_vote.save
  end

  def existing_vote_alter_or_destroy(previous_vote, current_vote, question)
    if previous_vote.vote == current_vote
      previous_vote.destroy    
    else
      previous_vote.vote = current_vote
      previous_vote.save
      add_to_question_cache(current_vote, question)
    end
  end

  def remove_from_question_cache(previous_vote, question)
    if previous_vote <0 
      question.down_votes_count -= previous_vote 
    else 
      question.up_votes_count -= previous_vote
    end
    question.owner.questions_score -= previous_vote
    question.owner.save
    question.save
  end

  def add_to_question_cache(vote, question)
    if vote <0 
      question.down_votes_count += vote 
    else 
      question.up_votes_count += vote
    end
    question.owner.questions_score += vote
    question.owner.save
    question.save 
  end
end