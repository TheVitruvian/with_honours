require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :first_name => "First Name",
        :last_name => "Last Name",
        :user_name => "User Name",
        :degree_classification => "Degree Classification",
        :degree_score => "Degree Score",
        :degree_achieved => false,
        :profile_picture => "MyText",
        :role => "Role"
      ),
      stub_model(User,
        :first_name => "First Name",
        :last_name => "Last Name",
        :user_name => "User Name",
        :degree_classification => "Degree Classification",
        :degree_score => "Degree Score",
        :degree_achieved => false,
        :profile_picture => "MyText",
        :role => "Role"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => "Degree Classification".to_s, :count => 2
    assert_select "tr>td", :text => "Degree Score".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
  end
end
