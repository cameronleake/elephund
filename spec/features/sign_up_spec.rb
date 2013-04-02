require 'spec_helper'

describe "SIGN UP:" do
  xit "Welcome email should be sent to new user" do
    @user = FactoryGirl.build(:user)
    visit signup_path
    fill_in "Email", :with => @user.email
    fill_in "First name", :with => @user.first_name
    fill_in "user_password", :with => @user.last_name
    fill_in "user_password_confirmation", :with => @user.password
    fill_in "Password confirmation", :with => @user.password
    pp User.find(:last)
    click_button "Sign Up"
    pp User.find(:last)
    pp last_email
    last_email.to.should include(@user.email)
    # last_email.subject.should include(@contact.subject)    
    # last_email.body.should include(@contact.name)
    # last_email.body.should include(@contact.email)  
    # last_email.body.should include(@contact.body)
  end
end