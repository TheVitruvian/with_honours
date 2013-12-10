class InitialSetupOfUsersQuestionsAnswersCommentsCompaniesAndUniversitys < ActiveRecord::Migration
  def change

    create_table :companies do |t|
      t.string  :user_name
      t.text    :biography
      # t.string :email
      t.text    :logo
      # t.string  :email
      # t.string :password
      # t.string :password_confirmation
      t.belongs_to :user
    end

    create_table :universities do |t|
      t.string  :name
      t.integer :ranking
      t.text    :logo
    end

    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :user_name
      t.string  :degree_classification
      t.string  :degree_score
      t.boolean :degree_achieved
      # t.string :email
      t.text :profile_picture
      t.string :role, default: 'user'
      # t.string :password
      # t.string :password_confirmation
      t.belongs_to :university
      t.timestamps
    end

    create_table :questions do |t|
      t.references :owner, polymorphic: true
      t.string :title
      t.text :content
      t.text :image
      t.boolean :flag, default: false
      t.timestamps
    end

    create_table :answers do |t|
      t.references :owner, polymorphic: true
      t.string :content
      t.boolean :flag, default: false
      t.belongs_to :question
      t.timestamps
    end

    create_table :comments do |t|
      t.references :owner, polymorphic: true
      t.string :content
      t.boolean :flag, default: false
      t.belongs_to :answer
      t.timestamps
    end

    create_table :stars do |t|
      t.belongs_to :user
      t.belongs_to :question
    end
  end
end
