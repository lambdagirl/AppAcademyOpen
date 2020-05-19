class User < ApplicationRecord
  validates :username, :session_token, presence: true
  validates :password_digest presence: {
    message: "Password can't be blank"
  }
  validates :session_token, uniqueness:true
  validates :password,  length: { minum:6, allow_nil: true}
  before_validation :ensure_session_token


  def self.find_by_credentials(username,password)
    user = User.find_by(username: username)
    if user && BCrypt::Password.new(user.password_digest).is_password?(password)
      return user 
    nil
  end

  def self.generate_session_token
  end

  def reset_session_token!
  end

  def ensure_session_token
  end
  def password=
  end
end
