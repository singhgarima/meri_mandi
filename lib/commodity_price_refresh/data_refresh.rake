require_relative '../commodity_price_refresh/commodity_data'
namespace :data do
  desc 'Refreshes the data'
  task :refresh => [:environment] do
    p 'Called refresh on commodity data'
    CommodityData.refresh
  end
end
