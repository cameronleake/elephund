require 'spec_helper'

describe "CONTROLLER >> ContactsController:" do
  context "When submitting a new Contact Us form:" do
    xit "Should validate each of the fields" do
      visit contact_path
      click_button "Submit"
      current_path.should eq(contact_path)
      page.should have_content("Please fill in all fields")
    end
    
    it "Should save all fields in the CONTACTS table" do
      @contact = FactoryGirl.build(:contact)
      visit contact_path
      fill_in "Name", :with => @contact.name
      fill_in "Email", :with => @contact.email
      fill_in "Subject", :with => @contact.subject
      fill_in "Body", :with => @contact.body
      click_button "Submit"
      current_path.should eq(root_path)
      Contact.find(:last).name.should eq(@contact.name)
      Contact.find(:last).email.should eq(@contact.email)
      Contact.find(:last).subject.should eq(@contact.subject)
      Contact.find(:last).body.should eq(@contact.body)          
    end    
    
    it "Email should be sent with form details" do
      @contact = FactoryGirl.build(:contact)
      visit contact_path
      fill_in "Name", :with => @contact.name
      fill_in "Email", :with => @contact.email
      fill_in "Subject", :with => @contact.subject
      fill_in "Body", :with => @contact.body
      click_button "Submit"
      last_email.to.should include("helpdesk@elephund.com")
      last_email.subject.should include(@contact.subject)    
      last_email.body.should include(@contact.name)
      last_email.body.should include(@contact.email)  
      last_email.body.should include(@contact.body)
    end
  end
end
