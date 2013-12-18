module ApplicationHelper
	def current_user 
  	@user = User.find(params[:id])
  end
end
