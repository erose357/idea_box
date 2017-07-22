class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :check_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def require_current_user
    render file: "/public/404" unless current_user
  end

  # def check_user
  #   if current_user.id != params[:user_id].to_i
  #     render file: "/public/404"
  #   else
  #   end
  # end
end
