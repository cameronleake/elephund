class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :email_verified, :email_verification_token
  validates_presence_of :password, :on => :create
  validates_presence_of :password, :on => :update  
  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email
  has_many :participations
  has_many :events, :through => :participations
  
  before_create { generate_reset_token(:auth_token) }
  
  def send_password_reset
    generate_reset_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
  
  def generate_reset_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  
  def generate_random_token
     SecureRandom.urlsafe_base64
  end
  
  def send_welcome_email
    UserMailer.welcome_message(self).deliver
  end
  
end
