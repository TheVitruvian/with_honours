# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



User.delete_all
Question.delete_all
Answer.delete_all
Company.delete_all


user1 = User.create!(user_name: "Neha", first_name: "Neha", profile_picture: nil, role: 'admin', email: "neshah07@gmail.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2013-11-18 11:18:14", last_sign_in_at: "2013-11-17 18:29:11", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1" )
user2 = User.create!(user_name: "Jamie", first_name: "Jamie", profile_picture: nil, role: 'admin', email: "wallacejamiec@gmail.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2013-11-18 11:18:14", last_sign_in_at: "2013-11-17 18:29:11", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")
user3 = User.create!(user_name: "Alex", first_name: "Alex", profile_picture: nil, role: 'admin', email: "alexham100@aol.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2013-11-18 11:18:14", last_sign_in_at: "2013-11-17 18:29:11", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")
user4 = User.create!(user_name: "Adam", first_name: "Adam", profile_picture: nil, role: 'user', email: "adam.buchan@gmail.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2013-11-18 11:18:14", last_sign_in_at: "2013-11-17 18:29:11", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")
user5 = User.create!(user_name: "AlexF", first_name: "AlexF", profile_picture: nil, role: 'user', email: "fakealexf@fakealexf.com", password: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2013-11-18 11:18:14", last_sign_in_at: "2013-11-17 18:29:11", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")

company1 = Company.create!(user_name: "General Assembly")

question1 = Question.create!(owner_type: "user", title: "Jokes!", content: 'Tell me a knock knock joke', image: 'placeholder')
question2 = Question.create!(owner_type: "company", title: "Jokes!", content: 'A journey of a thousand leagues begins beneath one’s feet.', image: 'placeholder')
question3 = Question.create!(owner_type: "user", title: "Jokes!", content: 'Do not go where the path may lead; go instead where there is no path and leave a trail.', image: 'placeholder')
question4 = Question.create!(owner_type: "company", title: "Jokes!", content: 'I haven’t failed. I’ve just found 10,000 ways that won’t work.', image: 'placeholder')
question5 = Question.create!(owner_type: "user", title: "Jokes!", content: 'The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart', image: 'placeholder')
question6 = Question.create!(owner_type: "user", title: "Jokes!", content: 'It is during our darkest moments that we must focus to see the light', image: 'placeholder')
question7 = Question.create!(owner_type: "user", title: "Jokes!", content: 'Try to be like the turtle - at ease in your own shell.', image: 'placeholder')

answer1 = Answer.create!(owner_type: "company", content: 'Happiness is not something you postpone for the future; it is something you design for the present.')
answer2 = Answer.create!(owner_type: "user", content: 'What we achieve inwardly will change outer reality.')
answer3 = Answer.create!(owner_type: "company", content: 'What we obtain too cheap, we esteem too lightly: it is dearness only that gives every thing its value.')

company1.questions << question2
company1.questions << question4

user1.questions << question1
user4.questions << question3
user5.questions << question5
user5.questions << question6
user5.questions << question7

user3.answers << answer1
user2.answers << answer2
company1.answers << answer3

question1.answers << answer1
question2.answers << answer3
question7.answers << answer2


    

# comment1 = Comment.create!(content: 'So true!')
# comment2 = Comment.create!(content: 'Needed to read this today!')
# comment3 = Comment.create!(content: 'Amazing words of wisdom')
# comment4 = Comment.create!(content: 'Spot on!', flag: true)
# comment5 = Comment.create!(content: 'Cool!', flag: true)
# comment6 = Comment.create!(content: 'Awesome!', flag: true)
# comment7 = Comment.create!(content: 'Great Quote!', flag: true)
# comment8 = Comment.create!(content: 'This is silly!', flag: true)
# comment9 = Comment.create!(content: 'Troll!', flag: true)
# comment10 = Comment.create!(content: 'Super Troll!', flag: true)