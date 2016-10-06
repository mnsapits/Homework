# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  before_validation :ensure_session_token
  validates :username, :session_token, presence: true
  validate :password_digest, presence: { message: "Password can't be blank" }
  validate :password, length: {minimum: 6, allow_nil: true}

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    # return nil if user.nil?
    # user.is_password?(password) ? user : nil
  end

  def self.generate_session_token

  end
end
