class SearchController < ApplicationController
	def index
		@results = []
	end

	def fetch
    flash.clear
    flash[:error] = t('search.no_criteria') and render :index and 
      return if search_criteria.all? {|s| params[s].blank? }

    search_date = params['date'].blank? ? Date.today : Date.strptime(params['date'], '%d-%m-%Y') 

		@results = CommodityPrice.fetch(params['commodity'], search_date, params['market'], params['district'], params['state'])
    flash[:notice] = t('search.no_results') if @results.empty?
		render :index
	end

  private
  def search_criteria
    ['commodity', 'date', 'market', 'district', 'state']
  end
end
