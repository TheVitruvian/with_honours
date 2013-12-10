class AddCacheColumnToQuestionsAnswersandComments < ActiveRecord::Migration
  def self.up
    add_column :questions, :up_votes_count, :integer, :default => 0
    add_column :questions, :down_votes_count, :integer, :default => 0
    add_column :answers, :up_votes_count, :integer, :default => 0
    add_column :answers, :down_votes_count, :integer, :default => 0
    add_column :comments, :up_votes_count, :integer, :default => 0
    add_column :comments, :down_votes_count, :integer, :default => 0
  end

  def self.down
    remove_column :questions, :up_votes_count
    remove_column :answers, :up_votes_count
    remove_column :comments, :up_votes_count
    remove_column :questions, :down_votes_count
    remove_column :answers, :down_votes_count
    remove_column :comments, :down_votes_count
  end

end
