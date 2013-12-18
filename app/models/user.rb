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
#

class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :microposts

  before_save :create_remember_token

  def create_remember_token
  	self.remember_token = SecureRandom.urlsafe_base64
  end

  def feed 
  	@microposts = Microposts.where('user_id = ?', id)
  end
end
