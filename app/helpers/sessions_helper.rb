module SessionsHelper
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

  
  def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
