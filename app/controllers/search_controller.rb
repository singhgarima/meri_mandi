class SearchController < ApplicationController
	def index
		@results = []
	end

	def fetch
		@results = {}
		@results = CommodityPrice.search(params[:query], Date.today)
		render :index
	end
end
