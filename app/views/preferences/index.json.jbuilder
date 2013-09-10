json.id           @current_user.id
json.name         @current_user.name
json.mobile       @current_user.mobile
json.city         @current_user.city
json.state        @current_user.state.name

json.watchlist @preferences do |preference|
  json.id         preference.id

  json.commodity do
    json.id       preference.variety.commodity.id
    json.name     preference.variety.commodity.name
    json.variety  preference.variety.name
  end

  json.market do
    json.name     preference.market.name
    json.district preference.market.district.name
    json.state    preference.market.district.state.name
  end
end