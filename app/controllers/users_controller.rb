class UsersController < ApplicationController

	#wir wollen nicht dass sich ein user einloggen muss bevor er sich anmeldet, also:
	skip_before_filter :authenticate, only: [:new, :create]

	def new
	end

	def create 
		@user = User.create(params[:user])
		sign_in(@user)
		redirect_to user_path(@user.id)
	end

	def show
		@user = User.find(params[:id])
	end

end
