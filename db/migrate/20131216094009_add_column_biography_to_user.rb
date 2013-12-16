class AddColumnBiographyToUser < ActiveRecord::Migration
  def change
    add_column :users, :biography, :text, :default => ""
  end
end
