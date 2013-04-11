class ContactsController < ApplicationController
  
  class ContactFormJob < Struct.new(:contact)
    def perform
      ContactMailer.contact_us(contact).deliver
    end
  end
  
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      # Delayed::Job.enqueue ContactFormJob.new(@contact)
      @contact.delay.send_contact_form
      redirect_to root_path, notice: "Form submitted!"
    else
      flash.now.alert = "Please fill in all fields."
      render action: "new"
    end
  end
end
