class RestaurantsController < ApplicationController

include Yelp::V2::Search::Request
include Yelp::V2::Business::Request

	def index
			yelpster_query1
			yelpster_query2_geodata
	end

	def new
			yelpster_fulllist_query
	end


	def show
		@restaurant_id = params[:id]

		client = Yelp::Client.new
		request = Id.new(
        :yelp_business_id => @restaurant_id)
		@response = client.search(request)
		@restaurant_name = params[:name]
		@posts = Post.where(:restaurant_id => params[:id])
	end


end
