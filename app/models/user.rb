# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  email          :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  remember_token :string(255)
#  password_hash  :string(255)
#  password_salt  :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password

  attr_accessor :password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :microposts

  before_save :create_remember_token, :encrypt_password

  def self.authenticate(email, password)
  	user = User.find_by_email(email)
  	if user && user.password_hash = BCrypt::Engine.hash_secret(password, user.password_salt)
  		user
  	else
  		nil
  	end
  end

  def create_remember_token
  	self.remember_token = SecureRandom.urlsafe_base64
  end

  def encrypt_password
  	if password.present?
  		self.password_salt = BCrypt::Engine.generate_salt
  		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  	end
  end

  
end
