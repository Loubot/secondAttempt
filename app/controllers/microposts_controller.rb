class MicropostsController < ApplicationController


	def create
		@micropost = @user.microposts.build(params[:content])
		if @micropost.save
			flash[:success] = 'Micropost created'
			redirect_to root_url
		end
	end

	def destroy

	end

end