class CreateSearches < ActiveRecord::Migration
  def self.up
    create_table :searches do |t|
      t.string :keywords
      t.integer :questions_score
      t.integer :answers_score
      t.integer :comments_score
      t.string :university
      t.string :degree_type
      t.boolean :degree_achieved
      t.string :degree_classification
      t.integer :total_score
      t.string :category
      t.timestamps
    end
  end

  def self.down
    drop_table :searches
  end
end
