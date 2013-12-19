class SearchesController < ApplicationController

  def show
    @search = Search.find(params[:id])
    @current_agent = current_agent
    @votes = votes_counter
  end

  def create
    params[:search]["university"].delete("")

    @search = Search.new(params[:search])
    if @search.save
      redirect_to @search, :notice => "Successfully created search."
    else
      render :action => 'new'
    end
  end

  def new
    @search = Search.new
    @current_agent = current_agent
    @votes = votes_counter
  end

end
