class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @question_up_score = @question_down_score = @answer_up_score = @answer_down_score = @comment_up_score = @comment_down_score = 0

    @user= User.find(params[:id])

    @votes = @user.question_votes.count + @user.answer_votes.count + @user.comment_votes.count
  end
end
