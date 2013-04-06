require 'spec_helper'

describe "LOG IN:" do

  before(:all) do
    @user = FactoryGirl.create(:user)
  end
  
  after(:all) do
    @user.destroy
  end
  
  it "Takes user to account page when logging in" do
    visit login_path
    fill_in "email", :with => @user.email
    fill_in "password", :with => "secret"
    click_button "Log In"
    page.should have_content("My Events")
  end
  
end