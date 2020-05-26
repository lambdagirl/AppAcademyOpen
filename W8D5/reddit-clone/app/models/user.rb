class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password, length: {minimum: 6}, allow_nil: true, presence: true
  
  has_many :votes, inverse_of: :users
  
  has_many :subs,
    class_name: :Sub,
    foreign_key: :moderator_id,
    primary_key: :id,
    inverse_of: :moderator

  has_secure_password

  after_initialize :ensure_session_token

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

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user && user.try(:authenticate, password)
      return user
    else
      nil
    end
  end
end
