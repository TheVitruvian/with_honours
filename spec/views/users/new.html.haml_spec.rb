require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :first_name => "MyString",
      :last_name => "MyString",
      :user_name => "MyString",
      :degree_classification => "MyString",
      :degree_score => "MyString",
      :degree_achieved => false,
      :profile_picture => "MyText",
      :role => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_first_name[name=?]", "user[first_name]"
      assert_select "input#user_last_name[name=?]", "user[last_name]"
      assert_select "input#user_user_name[name=?]", "user[user_name]"
      assert_select "input#user_degree_classification[name=?]", "user[degree_classification]"
      assert_select "input#user_degree_score[name=?]", "user[degree_score]"
      assert_select "input#user_degree_achieved[name=?]", "user[degree_achieved]"
      assert_select "textarea#user_profile_picture[name=?]", "user[profile_picture]"
      assert_select "input#user_role[name=?]", "user[role]"
    end
  end
end
