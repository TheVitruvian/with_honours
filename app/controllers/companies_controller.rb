class CompaniesController < ApplicationController
  def index
    @company = Company.all
  end
end