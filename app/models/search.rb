class Search < ActiveRecord::Base
  attr_accessible :keywords, :question_score, :answer_score, :comments_score, :university, :degree_type, :degree_achieved, :degree_classification, :total_score, :category, :questions_score, :answers_score


  def users
    @users ||= find_users
  end

  def find_users
    User.find(:all, :conditions => conditions)
  end

private

  def keyword_conditions
    ["users.user_name LIKE ?", "%#{keywords}%"] unless keywords.blank?
  end

  def minimum_question_score_conditions
    ["users.questions_score >= ?", questions_score] unless questions_score.blank?
  end

  # def minimum_answer_score_conditions
  #   ["users.answers_score >= ?", answers_score] unless answers_score.blank?
  # end

  # def minimum_comment_score_conditions
  #   ["users.comments_score >= ?", comments_score] unless comments_score.blank?
  # end

  # def universities_conditions
  #   ["users.university WHERE ID IN ?", university] unless university.blank?
  # end

  # def degree_type_conditions
  #   ["users.degree_type WHERE degree_type IN ?", degree_type] unless degree_type.blank?
  # end

  # def degree_achieved_conditions
  #   ["users.degree_achieved WHERE degree_achieved = ?", degree_achieved] unless degree_achieved.blank?
  # end

  # def degree_classification_conditions
  #   ["users.degree_classification WHERE degree_classification IN ?", degree_classification] unless degree_classification.blank?
  # end

  def conditions
    [conditions_clauses.join(' AND '), *conditions_options]
  end

  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end

  def conditions_options
    conditions_parts.map { |condition| condition[1..-1] }.flatten
  end

  def conditions_parts
    private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
  end

end
