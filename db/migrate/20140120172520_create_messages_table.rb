class CreateMessagesTable < ActiveRecord::Migration
  def change
    create_table(:messages) do |t|
      t.references  :owner, polymorphic: true
      t.references  :recipient, polymorphic: true
      t.string      :subject
      t.text        :content
      t.boolean     :is_read
      t.boolean     :is_archived
      t.datetime    :created_at
    end
  end
end