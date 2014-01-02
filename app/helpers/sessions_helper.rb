module SessionsHelper

  def sign_in(user)
    session[:user_id] = user.id
  end

	def logged_in
  	if session[:user_id] != nil
  		flash[:notice] = 'logged in'
  		current_user
  	else
  		flash[:notice] = 'not logged in'
  		nil  		
  	end
  end
  
  def correct_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end
  
  def current_user
		@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
  
  def no_current_user
    @current_user = nil
  end
end
