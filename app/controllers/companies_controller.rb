class CompaniesController < ApplicationController
  
  def index
    @company = Company.all
  end

  def show
    @question_up_score = @question_down_score = @answer_up_score = @answer_down_score = @comment_up_score = @comment_down_score = 0

    @company= Company.find(params[:id])
    @company.questions.each do |question|
      @question_up_score    += question.up_votes_count
      @question_down_score  += question.down_votes_count
    end

    @company.answers.each do |answer|
      @answer_up_score    += answer.up_votes_count
      @answer_down_score  += answer.down_votes_count
    end

    @company.comments.each do |comment|
      @comment_up_score    += comment.up_votes_count
      @comment_down_score  += comment.down_votes_count
    end

    @votes = @company.question_votes.count + @company.answer_votes.count + @company.comment_votes.count
  end

end