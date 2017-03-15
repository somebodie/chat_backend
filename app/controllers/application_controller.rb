class ApplicationController < ActionController::API

  # IS THE USER THE LOGGED IN
  def authenticate
    render json: {status: 401, message: "unauthorized"} unless decode_token(bearer_token)
  end

  # DOES THE USER OWN THE RESOURCE THEY'RE ASKING FOR
  def authorize
    render json: {status: 401, message: "unauthorized"} unless current_user.id == params[:id].to_i
  end

  def bearer_token
    pattern = /^Bearer /
    header  = request.env["HTTP_AUTHORIZATION"] # <= env
    header.gsub(pattern, '') if header && header.match(pattern)
  end

  def current_user
    return if !bearer_token

    decoded_jwt = decode_token(bearer_token)

    @current_user ||= User.find(decoded_jwt["user"]["id"])
    # if   @current_user == User.where(admin: true)
    #   admin = true
    # end
  end

  def decode_token(token)
    @token ||= JWT.decode(token, nil, false)[0] # this will error if the token is invalid or expired
  rescue
    render json: {status: 401, message: 'invalid or expired token'}
  end
# https://github.com/ga-students/wdi-remote-matey/blob/30a977fbc9adcfd5e361c7bb9bf2a2c8fc7e8ab9/unit_04/w13d02/instructor_notes/giphy_api/app/controllers/application_controller.rb

  def logged_in?
    current_user != nil
  end

  protected

  def authorize
    unless admin?
      # sends message if not current user
      flash[:error] = "unauthorized access"
      redirect_to home_path
      # redirects to if unauthorized
      false
      render json: {status: 401, message: "unauthorized"}
    end
  end

  def admin?
    @admin = User.where(admin: true)
    # current_user.try(:admin?)
    current_user == admin?
  end

  # https://github.com/plataformatec/devise/wiki/How-To:-Add-an-Admin-Role
end
# http://railscasts.com/episodes/20-restricting-access?autoplay=true
