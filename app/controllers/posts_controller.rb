class PostsController < ApplicationController

	def index
	end

	def create 
		post = Post.create(params[:post])

		redirect_to restaurant_path(params[:post][:restaurant_id])




	end



end
