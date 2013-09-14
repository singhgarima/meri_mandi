class DistrictsController < ApplicationController

  def markets
    district = District.find_by_name params[:name]
    render :json => district.markets
  end
end
