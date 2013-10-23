class OrdersController < ApplicationController


	def index
	end

	def create

		order = params[:order]
			order = Order.create(:restaurant_id => order[:restaurant_id], :user_id => current_user.id, :tip => order[:tip])
  
   # raise order.inspect
  	item = params[:item]
			order.items.create(:item_name => item[:item_name], :item_type => item[:item_type], :quantity => item[:quantity])


		raise item.inspect
	#order.items.create damit haben wir ein leeres hash erstellt => sieht man in bash. geht deshlab weil wir belongs<-to beziehung haben

 
  #wir schreiben current_user.id weil es nichts ausmacht. wenn es keinen current_user gibt, dann schreibt es einfach nil

  #item type wäre appetizer, dessert, main, beverage

	end


	def show
		@order = Order.find(params[:id])
	end

end
