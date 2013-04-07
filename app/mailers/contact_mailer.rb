class ContactMailer < ActionMailer::Base

  def contact_us(contact)
    @contact = contact
    attachments.inline["Welcome-Email-Header.jpg"] = File.read("#{Rails.root}/app/assets/images/Welcome-Email-Header.jpg")    
    mail(:to => "helpdesk@elephund.com", :subject => "Contact Us Form: #{@contact.subject}", :from => "noreply@elephund.com")
  end

end
