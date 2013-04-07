class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name
  validates_presence_of :password, :on => :create
  validates_presence_of :password, :on => :update  
  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email
  has_many :participations
  has_many :events, :through => :participations
  
  before_create { generate_token(:auth_token) }
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
  
  # Generates a random token
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  
  def send_welcome_email
    UserMailer.welcome_message(self).deliver
  end
  
end
