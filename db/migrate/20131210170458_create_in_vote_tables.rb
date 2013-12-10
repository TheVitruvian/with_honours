class CreateInVoteTables < ActiveRecord::Migration
  def change
    create_table :question_votes do |t|
      t.references :owner, polymorphic: true
      t.integer :vote
    end

    create_table :answers_votes do |t|
      t.references :owner, polymorphic: true
      t.integer :vote
    end

    create_table :comment_votes do |t|
      t.references :owner, polymorphic: true
      t.integer :vote
    end

  end
end
