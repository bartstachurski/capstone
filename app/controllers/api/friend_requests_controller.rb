class Api::FriendRequestsController < ApplicationController
  # before_action :set_friend_request, except: [:index, :create]

  def create
    friend = User.find(params[:friend_id])
    @friend_request = current_user.friend_requests.new(friend: friend)
    @friend_request.save

    if @friend_request.save
      render 'show.json.jb'
    else
      render json: @friend_request.errors, status: :unprocessable_entity
    end
  end

  def index
    @incoming = FriendRequest.where(friend: current_user)
    @outgoing = current_user.friend_requests
    render 'index.json.jb'
  end

  def update
    @friend_request = FriendRequest.find_by(id: params[:id])
    if params[:accepted] == true
      @friend_request.accept
      render json: "request accepted"
    else
      render json: "failed to accept"
    end
  end

  def destroy
    @friend_request = FriendRequest.find_by(id: params[:id])
    @friend_request.destroy
    render 'destroy.json.jb'
    # head :no_content
  end
  # ...
  # private

  # def set_friend_request
  #   @friend_request = FriendRequest.find(params[:id])
  # end

end
