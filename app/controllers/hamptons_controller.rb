class HamptonsController < ApplicationController

include Yelp::V2::Search::Request

def index
end

def about
	render :about
end

def contact
	render :contact
end


end
