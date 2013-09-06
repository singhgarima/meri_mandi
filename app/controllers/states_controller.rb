class StatesController < ApplicationController

  def districts
    state = State.find_by_name params[:name]
    render :json => state.districts
  end
end
