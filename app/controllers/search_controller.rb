class SearchController < ApplicationController
	def index
		@results = []
	end

	def fetch
    flash.clear
    flash[:error] = 'No search criteria mentioned' and render :index and 
      return if search_criteria.all? {|s| params[s].blank? }
		@results = CommodityPrice.search(params['query'], Date.today)
    flash[:notice] = 'No results found for this criteria'
		render :index
	end

  private
  def search_criteria
    ['query', 'date', 'location']
  end
end
