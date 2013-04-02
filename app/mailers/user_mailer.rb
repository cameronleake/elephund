class UserMailer < ActionMailer::Base
  default from: "noreply@elephund.com"

  def password_reset(user)
    @user = user
    attachments["Elephund_Logo-Email.jpg"] = File.read("#{Rails.root}/public/images/Elephund_Logo-Email.jpg")
    mail :to => user.email, :subject => "Password Reset"
  end
  
  def welcome_message(user)
    @user = user
    attachments["Elephund_Logo-Email.jpg"] = File.read("#{Rails.root}/public/images/Elephund_Logo-Email.jpg")
    mail :to => user.email, :subject => "Welcome to Elephund"
  end
  
end
