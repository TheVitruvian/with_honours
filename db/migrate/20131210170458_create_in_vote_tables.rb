class CreateInVoteTables < ActiveRecord::Migration
  def change
    create_table :question_votes do |t|
      t.references :owner, polymorphic: true
      t.belongs_to :question
      t.integer :vote
    end

    create_table :answer_votes do |t|
      t.references :owner, polymorphic: true
      t.belongs_to :answer
      t.integer :vote
    end

    create_table :comment_votes do |t|
      t.references :owner, polymorphic: true
      t.belongs_to :comment
      t.integer :vote
    end

  end
end
