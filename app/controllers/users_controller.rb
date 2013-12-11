class UsersController < Devise::RegistrationsController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def new
    super
  end

  def create
    super
  end

  def edit
    super
  end

  def destroy
    super
  end

  def create
    super
  end

  def my_questions

  end
  
  def my_answers

  end

  def my_comments

  end

  def star
    #for when a company or mentor picks a top answer
  end
end
