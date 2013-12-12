class CompaniesController < Devise::RegistrationsController
  def index
    @company = Company.all
  end

  def show
    super
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

end