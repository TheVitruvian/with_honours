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
    @user= User.find(params[:id])
    @votes = @user.question_votes.count + @user.answer_votes.count + @user.comment_votes.count
    @questions = @user.questions.order('hotness DESC')
  end
end
