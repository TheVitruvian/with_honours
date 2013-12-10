class CommentsController < ApplicationController
  
  def create
    @answer = Answer.find(params[:answer_id])
    @comment = Comment.new(params[:comment])
    @comment.answer_id = @question
    @comment.post_id = @answer
    @comment.owner_id = current_user.id
    @comment.owner_type = current_user.class.to_s

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