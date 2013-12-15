class AddColumnsToCacheScoreToUser < ActiveRecord::Migration
  def change
    add_column :users, :questions_score, :integer, :default => 0
    add_column :users, :answers_score, :integer, :default => 0
    add_column :users, :comments_score, :integer, :default => 0
    add_column :users, :votes_count, :integer, :default => 0
  end
end
