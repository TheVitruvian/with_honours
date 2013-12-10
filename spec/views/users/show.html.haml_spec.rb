require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :first_name => "First Name",
      :last_name => "Last Name",
      :user_name => "User Name",
      :degree_classification => "Degree Classification",
      :degree_score => "Degree Score",
      :degree_achieved => false,
      :profile_picture => "MyText",
      :role => "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/User Name/)
    rendered.should match(/Degree Classification/)
    rendered.should match(/Degree Score/)
    rendered.should match(/false/)
    rendered.should match(/MyText/)
    rendered.should match(/Role/)
  end
end
