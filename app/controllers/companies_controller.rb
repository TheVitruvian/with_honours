class CompaniesController < ApplicationController
  
  def index
    @company = Company.all
  end

  def show
    @company= Company.find(params[:id])
  end

end