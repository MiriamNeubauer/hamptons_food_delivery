class RestaurantsController < ApplicationController

include Yelp::V2::Search::Request
include Yelp::V2::Business::Request

	def index
	
		restaurant = params[:restaurant]

		client = Yelp::Client.new

		request = Location.new(
				:state => "NY",
				:city => restaurant[:town],
				:term => "restaurant #{restaurant[:cuisine]} ")

		@response = client.search(request)

		# render :inline => "#{response}"


	end

	def new

		# @restaurant = Restaurant.new

		# 		# construct a client instance
		# client = Yelp::Client.new
		#  # search for businesses via bounding box geo coords'
		# cities = ["Sag Harbor", "Bridgehampton", "Easthampton", "Southampton", "Westhampton"]

		# @response1 = Hash.new 
		# cities.each do |city| 

		# request = Location.new(
	 #             :term => "restaurant" || "food" || "dinner" || "lunch" || "breakfast" || "brunch" || "bar",
	 #             :city => city)
		# 		# :longitues, :latitude, :street,:phone, :reviews, :hourd, :website, :rating, :parking, :vegetarian, :yelplink
		# 	# ???can i access here everything that comes up int he hash?
		# @response1[city] = client.search(request)
		# puts "."*50
		# p @response1[city]
		# # oder soll ich eine neue, eigene/nicht-REST methode da<für machen und das ganz an den anfang stellen damit gleich zum beginn der seite die DB geladen wird
		# #aber selbst wenn ich alle werte anzeigen will -speichern muss ich ja nur die werte, die mit posts, landkarte und usern zu tun haben oder?
		# end
	end


	def show
		@restaurant_id = params[:id]

			# das hier unten: holt sich einfach die ganze info aus dem 
			# hash, die zu dieser speziellen id angefragt wurde, die man vorher geklcikt hat

		client = Yelp::Client.new

		request = Id.new(
        :yelp_business_id => @restaurant_id)

		@response = client.search(request)

	end


end
