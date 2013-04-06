require 'spec_helper'

describe "SIGN UP:" do
  it "Welcome email should be sent to new user" do
    @user = FactoryGirl.build(:user)
    visit signup_path
    fill_in "user_email", :with => @user.email
    fill_in "user_first_name", :with => @user.first_name
    fill_in "user_last_name", :with => @user.last_name
    fill_in "user_password", :with => @user.password
    fill_in "user_password_confirmation", :with => @user.password
    click_button "Sign Up"
    last_email.to.should include(@user.email)
    last_email.subject.should include("Welcome")
  end
end