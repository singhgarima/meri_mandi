class PreferencesController < ApplicationController
  include Authorize::Controller

  def index
    @current_user = current_user
    @preferences = @current_user.user_preferences.includes({ market: { district: :state } }, { variety: :commodity }) || []
  end
end