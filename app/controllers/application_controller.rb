class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def require_signed_in
    redirect_to root_path unless current_user
  end

  def current_user
    @current_user ||= begin
      session[:user_id] and GuestUser.find(session[:user_id])
    end
  end
  helper_method :current_user
end
