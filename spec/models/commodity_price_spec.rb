require 'spec_helper'

describe CommodityPrice do
	it { should belong_to(:variety) }
	it { should belong_to(:market) }

  describe "#search" do
    it "should get commodity prices for all varieties and all commodities with name on a given date" do
      commodity1 = FactoryGirl.create :commodity, name: 'Green Grams'
      commodity2 = FactoryGirl.create :commodity, name: 'Green Chillies'
      variety1 = FactoryGirl.create :variety, name: 'Others', commodity: commodity1
      variety2 = FactoryGirl.create :variety, name: 'Chillies', commodity: commodity2
      variety3 = FactoryGirl.create :variety, name: 'Extra'

      cp1 = FactoryGirl.create :commodity_price, variety: variety1
      cp2 = FactoryGirl.create :commodity_price, variety: variety2
      FactoryGirl.create :commodity_price, variety: variety3

      CommodityPrice.search('Green', Date.today).should == [cp1, cp2]
    end
  end
end
