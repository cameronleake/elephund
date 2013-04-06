class ContactMailer < ActionMailer::Base

  def contact_us(contact)
    @contact = contact
    mail(:to => "helpdesk@elephund.com", :subject => "Contact Us Form: #{@contact.subject}", :from => "noreply@elephund.com")
  end

end
