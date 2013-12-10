# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    user_name "MyString"
    degree_classification "MyString"
    degree_score "MyString"
    degree_achieved false
    profile_picture "MyText"
    role "MyString"
  end
end
