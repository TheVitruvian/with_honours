# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140120172520) do

  create_table "answer_votes", :force => true do |t|
    t.integer "owner_id"
    t.string  "owner_type"
    t.integer "answer_id"
    t.integer "vote"
  end

  create_table "answers", :force => true do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.text     "content"
    t.boolean  "flag",             :default => false
    t.integer  "question_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "up_votes_count",   :default => 0
    t.integer  "down_votes_count", :default => 0
  end

  create_table "comment_votes", :force => true do |t|
    t.integer "owner_id"
    t.string  "owner_type"
    t.integer "comment_id"
    t.integer "vote"
  end

  create_table "comments", :force => true do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.text     "content"
    t.boolean  "flag",             :default => false
    t.integer  "answer_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "up_votes_count",   :default => 0
    t.integer  "down_votes_count", :default => 0
  end

  create_table "companies", :force => true do |t|
    t.string   "user_name"
    t.text     "biography"
    t.text     "logo"
    t.integer  "user_id"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "questions_score",        :default => 0
    t.integer  "answers_score",          :default => 0
    t.integer  "comments_score",         :default => 0
    t.integer  "votes_count",            :default => 0
  end

  add_index "companies", ["email"], :name => "index_companies_on_email", :unique => true
  add_index "companies", ["reset_password_token"], :name => "index_companies_on_reset_password_token", :unique => true

  create_table "messages", :force => true do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.string   "subject"
    t.text     "content"
    t.boolean  "is_read"
    t.boolean  "is_archived"
    t.datetime "created_at"
  end

  create_table "question_votes", :force => true do |t|
    t.integer "owner_id"
    t.string  "owner_type"
    t.integer "question_id"
    t.integer "vote"
  end

  create_table "questions", :force => true do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "title"
    t.text     "content"
    t.text     "image"
    t.boolean  "flag",             :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "up_votes_count",   :default => 0
    t.integer  "down_votes_count", :default => 0
    t.string   "category"
    t.float    "hotness",          :default => 0.0
  end

  create_table "searches", :force => true do |t|
    t.string   "keywords"
    t.integer  "questions_score"
    t.integer  "answers_score"
    t.integer  "comments_score"
    t.string   "university"
    t.string   "degree_score"
    t.boolean  "degree_achieved"
    t.string   "degree_classification"
    t.integer  "total_score"
    t.string   "category"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "stars", :force => true do |t|
    t.integer "user_id"
    t.integer "question_id"
  end

  create_table "universities", :force => true do |t|
    t.string  "name"
    t.integer "ranking"
    t.text    "logo"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",             :default => ""
    t.string   "last_name",              :default => ""
    t.string   "user_name"
    t.string   "degree_classification",  :default => ""
    t.string   "degree_score",           :default => ""
    t.boolean  "degree_achieved",        :default => false
    t.text     "profile_picture",        :default => ""
    t.string   "role",                   :default => "user"
    t.integer  "university_id",          :default => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "email",                  :default => "",     :null => false
    t.string   "encrypted_password",     :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,      :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "provider"
    t.string   "uid"
    t.text     "degree_title",           :default => ""
    t.integer  "questions_score",        :default => 0
    t.integer  "answers_score",          :default => 0
    t.integer  "comments_score",         :default => 0
    t.integer  "votes_count",            :default => 0
    t.text     "biography",              :default => ""
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
