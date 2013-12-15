class AddColumnDegreeTitleToUser < ActiveRecord::Migration
  def change
    add_column :users, :degree_title, :text, :default => ""
  end
end
