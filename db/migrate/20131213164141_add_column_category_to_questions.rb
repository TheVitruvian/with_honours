class AddColumnCategoryToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :category, :string
    add_column :questions, :hotness, :float, :default => 0
  end
end
