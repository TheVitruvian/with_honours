class AddScoresColumnsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :questions_score, :integer, :default => 0
    add_column :companies, :answers_score, :integer, :default => 0
    add_column :companies, :comments_score, :integer, :default => 0
    add_column :companies, :votes_count, :integer, :default => 0
  end
end
