module SessionsHelper

def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		@current_user = user
	end
	#cookies permanent lässt den user eingeloggt so ca. 20 tage

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end
	#||= macht das ganze schneller; weil @current_value ist erst kürlich gesetzt worden und so kann man es schneller herholen
	#und muss nicht ganz durch die db schauen  

	def authenticate
		redirect_to new_session_path if !current_user
		# wir lenken den user zu dem new_sessions_path um falls es keinen current user gibt
		# current_user ? true : false 
		#ist die kürzere version aber if statement würden auch gehen
		# if current_user
		# 	return true
		# else
		# 	return false
		# end
	end
	
	def sign_out
		@current_user = nil
		cookies.delete(:remember_token)
		#wir können .delete auf cookies callen weil die cookies ein hash sind. wenn wir cookies.delete rufen dann können wir den key nennen, von dem wir den inhalt löschen wollen
	end
	
end
