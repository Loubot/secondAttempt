class MicropostsController < ApplicationController


	def create
		@micropost = current_user.microposts.build(params[:micropost])

		@micropost.save
		respond_to do |format|
			format.js
			format.json
		end
	end

	def destroy
		@micropost = current_user.microposts.find_by_id(params[:id])
		@micropost.destroy
		respond_to do |format|
			format.html{
				flash[:notice] = "Micropost deleted"
				redirect_to current_user }
			format.js
		end
	end

end	