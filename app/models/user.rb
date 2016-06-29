class User < ActiveRecord::Base
  
  has_many :deals
  has_many :tasks, through: :deals
  validates_presence_of :name, :password_digest
  has_secure_password

end