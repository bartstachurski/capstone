class User < ApplicationRecord
  has_many :friendships
  has_many :friends, :through => :friendships

  has_secure_password
  validates :email, presence: true, uniqueness: true

end
