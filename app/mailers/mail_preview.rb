class MailPreview < MailView

  def welcome_message
    @user = FactoryGirl.build(:user)
    mail = UserMailer.welcome_message(@user)
  end
  
  def password_reset
    @user = FactoryGirl.build(:user)
    @user.password_reset_token = "123456"
    @user.password_reset_sent_at = Time.zone.now
    mail = UserMailer.password_reset(@user)
  end
  
  def contact_us
    @contact = FactoryGirl.build(:contact)
    mail = ContactMailer.contact_us(@contact)
  end
  
end