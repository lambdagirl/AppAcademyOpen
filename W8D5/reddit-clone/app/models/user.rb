class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password, length: {minimum: 6}, allow_nil: true, presence: true
  
  has_secure_password
  before_validation :ensure_session_token

  def self.generate_session_token
    token = SecureRandom::urlsafe_base64
    while self.exists?(session_token: token)
      token = SecureRandom::urlsafe_base
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

end
