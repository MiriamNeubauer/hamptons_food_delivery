class UsersController < ApplicationController

	#wir wollen nicht dass sich ein user einloggen muss bevor er sich anmeldet, also:
	skip_before_filter :authenticate, only: [:new, :create]

	def new
	end

	def create 
		user = User.create(params[:user])
		sign_in(user)
		redirect_to restaurant_path
		#Alternative: rediret_to "/user/:id"
					#"/user/:id"
		#das geht zur show page --> s. im rake routes
		#redirect_to users_path würde zum index lenken
		#user_path(user.id) macht man damit man dem user.id seine spezifische eigene page zeigen
	end

	def show
		@user = User.find(params[:id])
	end

end
