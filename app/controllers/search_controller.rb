class SearchController < ApplicationController
	def index
		@results = []
	end

	def fetch
    flash.clear
    flash[:error] = 'No search criteria mentioned' and render :index and 
      return if search_criteria.all? {|s| params[s].blank? }

    search_date = params['date'].blank? ? Date.today : Date.strptime(params['date'], '%d-%m-%Y') 

		@results = CommodityPrice.search(params['query'], search_date)
    flash[:notice] = 'No results found for this criteria'
		render :index
	end

  private
  def search_criteria
    ['query', 'date', 'location']
  end
end
