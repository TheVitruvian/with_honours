class Search < ActiveRecord::Base
  attr_accessible :keywords, :question_score, :answer_score, :comments_score, :university, :degree_type, :degree_achieved, :degree_classification, :total_score, :category, :questions_score, :answers_score


  def users
    @users ||= find_users
  end

  def find_users
    User.find(:all, :conditions => conditions)
  end

  def keyword_conditions
    ["user.name LIKE ?", "%#{keywords}%"] unless keywords.blank?
  end

  def minimum_question_score_conditions
    ["user.questions_score >= ?", questions_score] unless questions_score.blank?
  end

  def minimum_answer_score_conditions
    ["user.answers_score >= ?", answers_score] unless answers_score.blank?
  end

  def minimum_comment_score_conditions
    ["user.comments_score >= ?", comments_score] unless comments_score.blank?
  end

  def universities_conditions
    ["user.university WHERE ID IN ?", university] unless university.blank?
  end

  def degree_type_conditions
    ["user.degree_type WHERE degree_type IN ?", degree_type] unless degree_type.blank?
  end

  def degree_achieved_conditions
    ["user.degree_achieved WHERE degree_achieved = ?", degree_achieved] unless degree_achieved.blank?
  end

  def degree_classification_conditions
    ["user.degree_classification WHERE degree_classification IN ?", degree_classification] unless degree_classification.blank?
  end

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
