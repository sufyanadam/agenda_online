require 'digest'

class User < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password

  validates_presence_of :dropbox_token, :dropbox_uid

  def has_password?(password)
    self.password_digest == encrypt(password)
  end

  def self.authenticate(email, password)
    user = find_by_email(email)

    user if user.has_password(password)
  end

  private

  def encrypt_password
    self.salt = salted_password unless has_password?(password)
    self.password_digest = encrypt(password)
  end

  def salted_password
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end

  def encrypt(string)
    secure_hash("#{salted_password}--#{string}")
  end
end
