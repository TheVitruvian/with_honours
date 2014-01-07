class QuestionsController < ApplicationController

  WEIGHTED_SCORE = 20
  
  before_filter :authenticate_user_or_company, except: [:index, :show]

  def index
    @current_agent = current_agent
    @votes = current_agent.votes_counter(current_agent) if current_agent

    uri = URI("#{request.original_url}").path
    @questions, @category = index_page_question_display(uri)

    @up_votes_cast, @down_votes_cast = current_agent.question_votes_identifier(current_agent) if current_agent

    @userVote = WEIGHTED_SCORE if current_agent.class.to_s == "Company" || current_user && current_user.role == "mentor" 
    respond_to do |format|
      format.html # index.html.erb
    


    end
  end

  def new
    authorize! :create, Question
    @question = Question.new
    @current_agent = current_agent
    @votes = current_agent.votes_counter(current_agent) if current_agent
  end

  def show
    @question = Question.find(params[:id])
    @current_agent = current_agent
    @votes = current_agent.votes_counter(current_agent) if current_agent
    @answers = @question.answers.order(:up_votes_count, :down_votes_count).reverse

    # improve with string interpolation for question, answer, comments?
    @up_votes_cast, @down_votes_cast = current_agent.question_votes_identifier(current_agent) if current_agent
    @answer_up_votes_cast, @answer_down_votes_cast = current_agent.answer_votes_identifier(current_agent) if current_agent
    @comment_up_votes_cast, @comment_down_votes_cast = current_agent.comment_votes_identifier(current_agent) if current_agent

    @userVote = WEIGHTED_SCORE if current_agent.class.to_s == "Company" || current_user && current_agent.role == "mentor" 
  end

  def create
    session[:anon_question_text] = "Hekjsdhflkjsdhflkajshdflakshdfiaw4fhlk.jahdfliasyefph" # pull session
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
    @current_agent = current_agent
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

    vote = WEIGHTED_SCORE*vote if current_agent.class.to_s == "Company" || current_agent.role == "mentor"

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
    question.owner.questions_score += vote.to_i
    question.owner.save
    question.save 
  end

  def index_page_question_display(uri)
    # change to params rather than URI
    page = params[:page] || 1
    per_page = 20
    case uri
      when "/HR"
        questions = Question.paginate(page: page, per_page: per_page).order('hotness DESC').where(category: 'HR')
        category = "HR"
      when "/Comms"
        questions = Question.paginate(page: page, per_page: per_page).order('hotness DESC').where(category: 'Communications')
        category = "Comms"
      when "/Consulting"
        questions = Question.paginate(page: page, per_page: per_page).order('hotness DESC').where(category: 'Consultancy')
        category = "Consulting"
      when "/Marketing"
        questions = Question.paginate(page: page, per_page: per_page).order('hotness DESC').where(category: 'Marketing')
        category = "Marketing"
      when "/General"
        questions = Question.paginate(page: page, per_page: per_page).order('hotness DESC').where(category: 'General')
        category = "General"
      else
        questions = Question.paginate(page: page, per_page: per_page).order('hotness DESC')
        category = "Top Questions"
    end
    return questions, category
  end
end