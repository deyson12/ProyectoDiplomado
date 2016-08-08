class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def logged_in?
  		redirect_to login_path if current_user.nil?
  end

  def current_user
  		@current_user ||= UserLogin.find_by(id:session['user_id'])
  end
end
