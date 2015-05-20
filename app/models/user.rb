
class User < ActiveRecord::Base
  has_many :messages
  has_secure_password

  validates :name, uniqueness: true
end
