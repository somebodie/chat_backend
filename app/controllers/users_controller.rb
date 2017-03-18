class UsersController < ApplicationController
  before_action :authorize, except: [:login, :create]
  # after_action :create, :login

  def create
    user = User.create(user_params)

    if user.save
      render json: {status: 200, message: "ok"}
    else
      render json: {status: 422, user: user.errors}
    end
  end

  def show
    render json: {status: 200, user: current_user}
  end

  def login
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      token = token(user.id, user.email)

      render json: {status: 201, user: user, token: token}
    else
      render json: {status: 401, message: "unauthorized"}
    end
  end

  private

  def token(id, email)
    JWT.encode(payload(id, email), 'aisforawesome', 'HS256')
  end

  def payload(id, email)
    {
      exp: (Time.now + 45.minutes).to_i,
      iat: Time.now.to_i,
      iss: 'somebody',
      user: {
        id: id,
        email: email
      }
    }
  end

  def user_params
    params.required(:user).permit(:name, :email, :password, :user_name, :admin)
  end

end
# https://github.com/somebodie/wdi-remote-matey/blob/master/unit_04/w13d02/instructor_notes/giphy_api/app/controllers/users_controller.rb
