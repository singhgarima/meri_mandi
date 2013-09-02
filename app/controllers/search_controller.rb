class SearchController < ApplicationController
	def index
		@results = []
	end

	def fetch
    flash[:notice] = 'No search criteria mentioned' and render :index and 
      return if search_criteria.all? {|s| params[s].blank? }
		@results = {}
		@results = CommodityPrice.search(params['query'], Date.today)
		render :index
	end

  private
  def search_criteria
    ['query', 'date', 'location']
  end
end
