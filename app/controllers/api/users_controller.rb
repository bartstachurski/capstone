class Api::UsersController < ApplicationController

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def index
    if params[:name]
      @users = User.where("name LIKE ?", "%#{params[:name]}%")
    else
      @users = User.all
    end
    render "index.json.jb"
  end
end
