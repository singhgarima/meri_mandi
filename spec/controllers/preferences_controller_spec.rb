require 'spec_helper'

describe PreferencesController do
  context :index do
    render_views
    before do
      @user = User.create!(mobile: '9000090000', state: FactoryGirl.create(:state), city: 'Amritsar')
      sign_in @user
    end

    it 'should return the user preferences' do
      preferences = [FactoryGirl.create(:preference, user: @user), FactoryGirl.create(:preference, user: @user)]

      get :index, format: :json

      response.should be_ok
      response.should render_template(:index)
      json_response = JSON.parse(response.body)
      json_response.should == {
        "id"   => @user.id,
        "name" => @user.name,
        "mobile" => @user.mobile,
        "state" => @user.state.name,
        "city" => @user.city,
        "watchlist" => [{
          "id" => preferences[0].id,
          "commodity" => {
              "id" => preferences[0].variety.commodity.id,
              "name" => preferences[0].variety.commodity.name,
              "variety" => preferences[0].variety.name
          },
          "market" => {
              "name" => preferences[0].market.name,
              "district" => preferences[0].market.district.name,
              "state" => preferences[0].market.district.state.name
          }
        },
        {
          "id" => preferences[1].id,
          "commodity" => {
              "id" => preferences[1].variety.commodity.id,
              "name" => preferences[1].variety.commodity.name,
              "variety" => preferences[1].variety.name
          },
          "market" => {
              "name" => preferences[1].market.name,
              "district" => preferences[1].market.district.name,
              "state" => preferences[1].market.district.state.name
          }
        }
      ]}
    end
  end
end