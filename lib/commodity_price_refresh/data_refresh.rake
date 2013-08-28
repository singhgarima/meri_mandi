require_relative '../commodity_price_refresh/commodity_data'
namespace :data do
  task :refresh => [:environment] do
    p 'Called refresh on commodity data'
    CommodityData.refresh
  end
end