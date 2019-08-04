class User < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :saved_breweries
  has_many :favorite_styles
  has_many :saved_brewery_groups
  has_many :shared_groups
  has_many :groups
  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend

  has_secure_password
  validates :email, presence: true, uniqueness: true

  def current_user
    User.first
  end

  def remove_friend(friend)
    current_user.friends.destroy(friend)
  end
end
