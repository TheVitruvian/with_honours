class CompaniesController < ApplicationController
  
  def index
    @company = Company.all
  end

  def show
    @company= Company.find(params[:id])
    @questions = @company.questions.order('hotness DESC')
    @votes = @company.question_votes.count + @company.answer_votes.count + @company.comment_votes.count
  end

end