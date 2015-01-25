class RatingsController < ApplicationController
	def index
		@ratings = Rating.all
	end
	def new
		@rating = Rating.new
		@beers = Beer.all
	end
	def create
		Rating.create score: params['rating']['score'], beer_id:params['rating']['beer_id']
		# #Allow this field, for securiry

		Rating.create params.require(:rating).permit(:score, :beer_id) 
		@ratings = Rating.all
		redirect_to ratings_path
	end
end