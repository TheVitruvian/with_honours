class QuestionsController < ApplicationController
  
  before_filter :authenticate_user_or_company, except: [:index, :show]

  def index
    @questions = Question.all

    #insert bespoke sorting algorithum
# SELECT id, title FROM videos ORDER BY LOG10(ABS(up_votes_count - down_votes_count) + 1) * SIGN(up_votes_count - down_votes_count) + (UNIX_TIMESTAMP(created_at) / 300000) DESC LIMIT 50

# or:
# SELECT Title, LOG10(up_votes_count - down_votes_count + 1) * 287015 + UNIX_TIMESTAMP(created_at) AS Hotness
# ORDER BY Hotness DESC

  end

  def new
    authorize! :create, Question
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    authorize! :read, @question
    @current_agent = current_agent
  end

  def create
    authorize! :create, Question
    @question = Question.new(params[:question])
    @question.owner_id = current_agent.id ||= current_company.id
    @question.owner_type = current_agent.class.to_s
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Answer was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
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
    
  end

end

