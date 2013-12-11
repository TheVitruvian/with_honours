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
        format.html { render action: "new" }
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

end