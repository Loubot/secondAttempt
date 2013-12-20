class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :save_user, :current_user 
  

  def save_user(user)
		cookies.permanent[:remember_token]= user.remember_token
		
	end

	def current_user
		@current_user = User.find_by_remember_token(cookies[:remember_token])
	end
end
