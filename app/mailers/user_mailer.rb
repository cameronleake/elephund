class UserMailer < ActionMailer::Base
  default from: "noreply@elephund.com"

  def password_reset(user)
    @user = user
    attachments.inline["Welcome-Email-Header.jpg"] = File.read("#{Rails.root}/app/assets/images/Welcome-Email-Header.jpg")
    mail :to => user.email, :subject => "Password Reset"
  end
  
  def welcome_message(user)
    @user = user
    attachments.inline["Welcome-Email-Header.jpg"] = File.read("#{Rails.root}/app/assets/images/Welcome-Email-Header.jpg")
    mail :to => user.email, :subject => "Welcome to Elephund"
  end
  
end
