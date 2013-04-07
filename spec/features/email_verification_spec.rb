require 'spec_helper'

describe "EMAIL VERIFICATION:" do
  context "When creating a new user:" do
    it "Should set Email_Verification and Email_Verification_Token values" do
      @user = FactoryGirl.build(:user)
      visit signup_path
      fill_in "user_email", :with => @user.email
      fill_in "user_first_name", :with => @user.first_name
      fill_in "user_last_name", :with => @user.last_name
      fill_in "user_password", :with => @user.password
      fill_in "user_password_confirmation", :with => @user.password
      click_button "Sign Up"
      User.find(:last).email_verified.should be_false
      User.find(:last).email_verification_token.should_not be_nil
      last_email.should have_content(User.find(:last).email_verification_token)
    end
    
    it "Should set EMAIL_VERIFIED attribute to TRUE when clicking email verification link" do
      @user = FactoryGirl.create(:user)
      pp User.find(:last).email_verified
      visit "http://localhost:3000/email_verifications/#{@user.email_verification_token}/edit"
      current_path.should eq(root_path)
      User.find(:last).email_verified.should eq(true)
      page.should have_content("Email Address Verified")      
    end
  end
end