class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  def accept
    Friendship.create(user_id: self.user_id, friend_id: self.friend_id)
    friend_request = FriendRequest.find_by(id: id)
    friend_request.destroy
    # @user = User.find_by(id: user_id)
    # @new_friend = User.find_by(id: friend_id)
    # @user.friends << @new_friend
    # @user.save
    # @new_friend.save
  end

end
