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
      CommodityPrice.should_receive(:fetch).
        with('bazinga', Date.today, nil, nil, nil).
        and_return(expected_result)

      get :fetch, commodity: 'bazinga'

      controller.instance_variable_get(:@results).should == expected_result
    end

    it "should populate flash error if no search criteria provided" do
      get :fetch

      flash[:error].should == "No search criteria mentioned"
    end

    it "should populate flash notice if no results from specifies search criteria" do
      CommodityPrice.should_receive(:fetch).
        with('kjashdkahsdk', Date.today, nil, nil, nil).
        and_return([])
      get :fetch, commodity: 'kjashdkahsdk'

      flash[:notice].should == "No results found for this criteria"
    end
  end

end
