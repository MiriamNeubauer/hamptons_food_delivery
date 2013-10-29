module RestaurantsHelper

	def yelpster_query1
			#asks yelpster api for restaurant data
			restaurant = params[:restaurant]

			client = Yelp::Client.new
			request = Location.new(
					:state => "NY",
					:city => restaurant[:town],
					:term => "restaurant #{restaurant[:cuisine]} ")
			@response = client.search(request)
			# render :json 

			#yelpster data to be used for geocoder
			@data = @response["businesses"]
			@businesses = []
			@data.each do |business|	
			address = business["location"]["display_address"][0] + business["location"]["display_address"][1] + business["location"]["display_address"][2]
			# p @data
	end

	def yelpster_query2_geodata
			#fragt die yelpster api nach geo-daten wie longitue und latitude. nein schmarrn, wir kriegen die daten ja eh zurück
						query = URI::escape(address) 
										#escape nimmt einfach die white spaces zwischen den sachen raus
							result = Typhoeus.get("http://maps.googleapis.com/maps/api/geocode/json?address=#{query}&sensor=true")
							result_hash = JSON.parse(result.body)
						result_hash["results"].each do |result|
							olat = result["geometry"]["location"]["lat"]
							olng = result["geometry"]["location"]["lng"]

							@businesses << {
								coordinates: [olat,olng],
								name: business["name"],
								city: business["location"]["city"]
							}
						end
		
	end


	def yelpster_fulllist_query
		# construct a client instance
		client = Yelp::Client.new
		# search for businesses via bounding box geo coords'
		@cities = ["Sag Harbor", "Bridgehampton", "Easthampton", "Southampton", "Westhampton"]

		@response1 = Hash.new 
				@cities.each do |city| 

					request = Location.new(
				             :term => "restaurant",
				             :city => city)
					@response1[city] = client.search(request)
		# puts "."*50
		# p @response1[city]
				end #end for do
	end

end
