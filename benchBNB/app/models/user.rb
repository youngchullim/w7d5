class User < ApplicationRecord
  attr_reader :password

  validates :username, uniqueness: true
  validates :session_token, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}
  

  def password=(password)
    self.session_token = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
  end

  def self.find_by_credentials(username, password)
    @user = User.find_by(username: username) 
    @user && @user.is_password?(password) ? @user : nil
  end
  
  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

end

