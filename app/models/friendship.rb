class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  after_create :create_inverse
  after_destroy :destroy_inverse

  def create_inverse
    self.class.create(user_id: self.friend.id, friend_id: self.user.id)
  end

  validates_uniqueness_of :user_id, scope: :friend_id

  def destroy_inverse
    friendship = friend.friendships.find_by(friend: user)
    friendship.destroy if friendship
  end
end
