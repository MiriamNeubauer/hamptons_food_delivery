class OrdersController < ApplicationController

	def index
	end

	def create

		order = params[:order]
			@order = Order.create(:restaurant_id => order[:restaurant_id], :user_id => current_user.id, :tip => order[:tip])
  

		params[:itemwrapper].each_value do |attrs|
			quantity = attrs.delete(:quantity).to_i
			i = @order.items.create(attrs)
			i.quantity = quantity
			i.save
		end

		#Sende bestätigungsemail für die bestellung an den user:
    # respond_to do |format|
    	if	@order.save
      #tell the MriimMailer to send a signup email after save
			#HamptonsfoodMailer.confirm_orders(current_user).deliver
 
     #    format.html { redirect_to(@user, notice: 'Confirmation email was sent to your account.') }
     #    format.json { render json: @user, status: :created, location: @user }
     #  else
     #    format.html { render action: 'new' }
     #    format.json { render json: @user.errors, status: :unprocessable_entity }
    	# end #end for if-else
  	end #end for do

  	redirect_to order #das gehtbzu der order variable die wir gerade kreiert ahben
		#am ende von create IMMER REDIRECT
	end


	def show
		@order_id = params[:id]
		@order = Order.find(params[:id])
		@username = params[:order]
	end

end
