class OrdersController < ApplicationController


	def index
	end

	def create
		order = params[:order]
			order = Order.create(:restaurant_id => order[:restaurant_id], :user_id => current_user.id, :tip => order[:tip])
  
   # raise order.inspect
  	# item = params[:item]
			# order.items.create(:item_name => item[:item_name], :item_type => item[:item_type], :quantity => item[:quantity].to_i)

		# binding.pry


		params[:itemwrapper].each_value do |attrs|
			quantity = attrs.delete(:quantity)
			i = order.items.create(attrs)
			i.quantity = quantity
			i.save
		end

		# raise item.inspect
	#order.items.create damit haben wir ein leeres hash erstellt => sieht man in bash. geht deshlab weil wir belongs<-to beziehung haben

 
  #wir schreiben current_user.id weil es nichts ausmacht. wenn es keinen current_user gibt, dann schreibt es einfach nil

  #item type wäre appetizer, dessert, main, beverage

  	redirect_to order #das gehtbzu der order variable die wir gerade kreiert ahben
		#am ende von create IMMER REDIRECT
	end


	def show


		@order_id = params[:id]
		#leitet nicht zu/id ws weil hier item UND order id auf der sieite sind und 
		#er nicht weiß welches er nehmen soll

		# redirect_to order_path
		# render :show

		@order = Order.find(params[:id])

		@username = params[:order]
	end

end
