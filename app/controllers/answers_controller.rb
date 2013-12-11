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


end