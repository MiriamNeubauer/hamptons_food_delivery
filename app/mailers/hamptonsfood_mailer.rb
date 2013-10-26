class HamptonsfoodMailer < ActionMailer::Base
  default from: "orders@hamptonsfooddelivery.com"

	def confirm_orders(user)

		@user = user #sie in ihrem modell User.new = @user genannt
		@url = 'http://hamptonsfooddelivery.herokuapp.com/sessions/new' #my website login
		mail(to: @user.email, subject: "Thank you for your order at Hamptosnfooddelivery.com")
	end

#im controller muss ich dann die methode signup_email auf die class miriam_mailer werfen,
#also: MiriamMailer.signup_email
#mail(to: @user.email, subject:

end
