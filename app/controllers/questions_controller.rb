class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    #insert bespoke sorting algorithum
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
      @question = Question.new(params[:question])
      @question.owner_id = current_user.owner_id
      @question.owner_type = current_user.owner_type

      respond_to do |format|
        if @answer.save
          format.html { redirect_to @question, notice: 'Answer was successfully created.' }
        else
          format.html { render action: "new" }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
  end


end

