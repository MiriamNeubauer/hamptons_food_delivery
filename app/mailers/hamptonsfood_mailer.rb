class HamptonsfoodMailer < ActionMailer::Base
  default from: "orders@hamptonsfooddelivery.com"

	def confirm_orders(user)

		@user = user #sie in ihrem modell User.new = @user genannt
		# @url = 'http://hamptonsfooddelivery.herokuapp.com/orders/show' #ich brauch in der email der bestellbestätigung keinen link
		mail(to: @user.email, subject: "Thank you for your order at Hamptosnfooddelivery.com")
	end
end
