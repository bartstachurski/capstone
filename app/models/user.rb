class User < ApplicationRecord
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :saved_breweries
  has_many :favorite_styles
  has_many :saved_brewery_groups
  has_many :shared_groups
  has_many :groups

  has_secure_password
  validates :email, presence: true, uniqueness: true

end
