class BasicSearchesController < ApplicationController
  def create
    query_terms = params[:query].split.join("|")
    @questions = Question.advanced_search query_terms
    render :index
  end
end
