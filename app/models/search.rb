class Search < ActiveRecord::Base
  attr_accessible :keywords, :question_score, :answer_score, :comments_score, :university, :degree_type, :degree_achieved, :degree_classification, :total_score, :category, :questions_score, :answers_score, :degree_score


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

  def minimum_answer_score_conditions
    ["users.answers_score >= ?", answers_score] unless answers_score.blank?
  end

  def minimum_comment_score_conditions
    ["users.comments_score >= ?", comments_score] unless comments_score.blank?
  end

  def universities_conditions
    uni = university.scan(/\d+/).map{|u| u.to_i}

    unless uni.empty?
      uni = uni.to_s
      uni.to_s.gsub!("[", "(")
      uni.to_s.gsub!("]", ")")

      ["users.university_id IN " + uni.to_s]
    end
  end

  def degree_type_conditions
    unless degree_score== "---\n- ''\n"
      degree = degree_score.scan(/(1st|2:1|2:2|3rd|Pass)+/).flatten.to_s
      degree.gsub!("[", "(")
      degree.gsub!("]", ")")
      degree.gsub!("\"", "'")

      ["users.degree_score IN " + degree.to_s]
    end
  end

  def degree_achieved_conditions
    ["users.degree_achieved = true", degree_achieved] if degree_achieved
  end

  def degree_classification_conditions

    unless degree_classification == "---\n- ''\n"
      degree_class = degree_classification.scan(/(BA|BSc|BEng|MA|MSc|MEng|LLM|MBA)+/).flatten.to_s
      degree_class.gsub!("[", "(")
      degree_class.gsub!("]", ")")
      degree_class.gsub!("\"", "'")

      ["users.degree_classification IN " + degree_class]
    end

    
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
