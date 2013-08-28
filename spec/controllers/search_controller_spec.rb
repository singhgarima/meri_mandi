require 'spec_helper'

describe SearchController do
	describe "#index" do
		it "should render template" do
			get :index

			response.should render_template :index
		end
	end

  describe "#fetch" do
    it "should render index templates" do
      get :fetch

      response.should render_template :index
    end

    it "should fetch the commodities returned by the search" do
      expected_result = [double(), double()]
      CommodityPrice.should_receive(:search).with('bazinga', Date.today).
        and_return(expected_result)

      get :fetch, query: 'bazinga'

      controller.instance_variable_get(:@results).should == expected_result
    end
  end

end
