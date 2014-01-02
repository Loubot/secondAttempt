class SessionsController < ApplicationController

  

  def new
    redirect_to current_user unless !signed_in?
  end

  def create
  	user = User.authenticate(params[:email],params[:password])
  	if user
  		sign_in(user)
  		redirect_to user
      flash[:success] = "Welcome #{user.name}"
  	else
  		redirect_to root_path
      flash[:error] = "No such user"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to log_in_path
  end
end
