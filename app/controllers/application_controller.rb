class ApplicationController < ActionController::API
  helper_method :admin?

  protected

  def admin?
    current_user.try(:admin?)
    # current_user.admin?
  end

  def authorize_admin
    unless admin?
      # sends message if not current user
      flash[:error] = "unauthorized access"
      redirect_to home_path
      # redirects to if unauthorized
      false
      render json: {status: 401, message: "unauthorized"}
    end

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
  end

  def decode_token(token)
    @token ||= JWT.decode(token, nil, false)[0] # this will error if the token is invalid or expired
  rescue
    render json: {status: 401, message: 'invalid or expired token'}
  end
end

# http://railscasts.com/episodes/20-restricting-access?autoplay=true

# blog_controller- before_filter :authorize, :expect => :index or [:index; :show]
# The code below can be used to grant admin status to the current user.
# current_user.update_attribute :admin, true
# https://github.com/plataformatec/devise/wiki/How-To:-Add-an-Admin-Role
