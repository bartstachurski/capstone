class Api::FriendshipsController < ApplicationController
  def create
    @user = current_user
    @new_friend = User.find_by(id: params[:user_id])
    @new_friend.friends << @user
    @user.friends << @new_friend
    @user.save
    @new_friend.save
    render 'create.json.jb'
  end

  def index
    @friends = current_user.friends
    render 'index.json.jb'
  end

  def destroy
    @friendship = Friendship.find_by(friend_id: params[:id], user_id: current_user.id)
    @friendship.destroy
    render 'destroy.json.jb'
  end

end
