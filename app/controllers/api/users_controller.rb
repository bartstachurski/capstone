class Api::UsersController < ApplicationController

  def create
    if params[:profile_photo].length > 0
      profile_photo = params[:profile_photo]
    else
      profile_photo = "https://i7.pngguru.com/preview/972/909/268/computer-icons-smiley-emoticon-youtube-wink-smiley-face.jpg"
    end

    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      bio: params[:bio],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      profile_photo: params[:profile_photo]
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

  def show
    @user = User.find_by(id: params[:id])
    if current_user.friends.include?(@user)
      @friend_status = true
    else
      @friend_status = false
    end
    render 'show.json.jb'
  end
end
