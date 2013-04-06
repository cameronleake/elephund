require 'spec_helper'

describe "ACCESS TO DATABASE VIA DIRECT URL PATHS:" do

  before(:all) do
    @user = FactoryGirl.create(:user)
  end
  
  after(:all) do
    @user.destroy
  end

  context "When logged in:" do
    it "INDEX page for USERS redirects to SHOW page for current_user" do
      visit login_path
      fill_in "email", :with => @user.email
      fill_in "password", :with => "secret"
      click_button "Log In"
      page.should have_content("My Events")
      visit '/users'
      page.should have_content("User")
      page.should have_content(@user.email)
    end
  
    it "Cannot access other USER's SHOW page - Redirects to CURRENT_USER PROFILE" do
      @user2 = FactoryGirl.create(:user)
      test_id = @user2.id
      visit login_path
      fill_in "email", :with => @user.email
      fill_in "password", :with => "secret"
      click_button "Log In"
      page.should have_content("My Events")
      visit "/users/#{test_id}"
      page.should have_content("User")
      page.should have_no_content(@user2.email)
    end
    
    it "Cannot access the EVENT SHOW page for events hosted by other users" do
      pending("Awaiting implementation of HOST table")
    end
    
  end
    
  context "When NOT logged in:" do
    it "Cannot access INDEX page for USERS" do
      visit "/users"
      current_path.should eq(root_path)
      page.should have_content("Not authorized")
    end
    
    it "Cannot access INDEX page for EVENTS" do
      visit "/events"
      current_path.should eq(root_path)
      page.should have_content("Not authorized")
    end
    
    it "Cannot access a User's SHOW page" do
      test_id = User.find(:first).id
      visit "/users/#{test_id}"
      current_path.should eq(root_path)
      page.should have_content("Not authorized")
    end
        
    it "Cannot access an Event's SHOW page" do
      FactoryGirl.create(:event)
      test_id = Event.find(:first).id
      visit "/events/#{test_id}"
      current_path.should eq(root_path)
      page.should have_content("Not authorized")
    end
  end
end
