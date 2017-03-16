class AdminsController < ApplicationController

  def index
    # ALL USERS
    user = User.all()
  end

  def create
    # MAKE USER ADMIN
    if current_user.admin?
      # The code below can be used to grant admin status to the current user.
      user.update_attribute :admin, true
    end
  end

  def show
    # SEARCH FOR USERS
    user = User.find_by(params[:id])
  end

  def update
    # UPDATE INFORMATION FOR USER
      user = User.find(params[:id])
      if user.update(user_params)
        render json: user
      else
        render json: user.errors, status: :unprocessable_entity
      end
  end

  def destroy
    # DELETE A USER
    user = User.find(params[:id]).destroy

    render json: {status: 204}
  end

  protected

  # def authorize
  #   unless admin?
  #     # sends message if not current user
  #     flash[:error] = "unauthorized access"
  #     redirect_to home_path
  #     # redirects to if unauthorized
  #     false
  #     render json: {status: 401, message: "unauthorized"}
  #   end
  # end

  def admin
    # admin = User.where(admin: true)
      current_user.admin?
  end

  def logged_in?
    current_user != nil
  end

  # https://github.com/plataformatec/devise/wiki/How-To:-Add-an-Admin-Role
end
