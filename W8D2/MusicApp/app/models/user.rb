class User < ApplicationRecord
  validates :activation_token, :email, :session_token, uniqueness: true, presence: true
  validates :password, length: { minimum: 6}, allow_nil: true , presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  has_secure_password

  after_initialize :ensure_session_token
  after_initialize :set_activation_token

  has_many :notes
  def self.generate_session_token
    token = SecureRandom.urlsafe_base64(16)
    while self.exists?(session_token: token)
      token = SecureRandom.urlsafe_base64(16)
    end
    token
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user && user.try(:authenticate, password)
      return user
    else
      nil
    end
  end

  def set_activation_token
    self.activation_token = generate_unique_activation_token
  end

############ for mailler #########################
  def generate_unique_activation_token
    token = SecureRandom.urlsafe_base64(16)
    while self.class.exists?(session_token: token)
      token = SecureRandom.urlsafe_base64(16)
    end
    token
  end

  def activate!
    self.update_attribute(:activated, true)
  end
end
