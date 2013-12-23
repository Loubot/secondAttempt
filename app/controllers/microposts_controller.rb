class MicropostsController < ApplicationController


	def create
		@micropost = current_user.microposts.build(params[:micropost])

		respond_to do |format|
			if @micropost.save
				format.html{
					flash[:success] = 'Micropost created'
					redirect_to current_user }

			else
				format.html {flash[:error] = "Micropost format invalid"
				redirect_to current_user}
			end
			format.js
			format.json { render json: @micropost.to_json(only: :content) }
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