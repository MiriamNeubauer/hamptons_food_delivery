class SessionsController < ApplicationController

#login form instead of sign up form

	include SessionsHelper #weil der sessions controller iwie nicht automatisch zugang zum sessions helper hat

	skip_before_filter :authenticate, only: [:new, :create]

	def new
	end
	#new does not do anything, it just renders a form

#whenever there is a new, there is also a create!!!

	def create
		#instead of saving the form data to a db, we save it to a cookie
		#first check whether th user is already there
		#check whether user already exists
		user = User.find_by_email(params[:user][:email])
		if user && user.authenticate(params[:user][:password])
		#if user already exists AND && wenn das passwort stimmt (gleicht 
			#alsi das de-encrypted pw aus der db mit dem eingegeben ab)...
		#...create session! :
			sign_in(user)
			redirect_to root_path
		else
			redirect_to new_session_path
		end
	end

	def destroy
		sign_out
		redirect_to new_session_path
	end
	#wir müssen die session deleten weil wir die login daten ja ncht in einer db speichern sonern temporär in cookies

end
