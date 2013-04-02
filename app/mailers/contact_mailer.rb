class ContactMailer < ActionMailer::Base

  def contact_us(contact)
    @contact = contact
    attachments["Elephund_Logo-Email.jpg"] = File.read("#{Rails.root}/public/images/Elephund_Logo-Email.jpg")
    mail(:to => "helpdesk@elephund.com", :subject => "Contact Us Form: #{@contact.subject}", :from => "noreply@elephund.com")
  end

end
