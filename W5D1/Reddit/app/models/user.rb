# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :username, uniqueness: true
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  after_initialize :ensure_session_token

  attr_reader :password

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(username, password)
    possible_user = User.find_by(username: username)
    return nil unless possible_user
    possible_user.is_password?(password) ? possible_user : nil
  end

  def is_password?(password)
    bc = BCrypt::Password.new(self.password_digest)
    bc.is_password?(password)
  end

  def password=(password)
    @password = password
    password_digest = BCrypt::Password.create(password)
    self.password_digest = password_digest
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end
end
