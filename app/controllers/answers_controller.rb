class AnswersController < ApplicationController

def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(params[:answer])
    @answer.post_id = @question
    @answer.owner_id = current_user.id
    @answer.owner_type = current_user.class.to_s

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