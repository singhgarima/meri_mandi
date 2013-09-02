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

    it "should populate flash error if no search criteria provided" do
      get :fetch

      flash[:error].should == "No search criteria mentioned"
    end

    it "should populate flash notice if no results from specifies search criteria" do
      get :fetch, query: 'kjashdkahsdk'

      flash[:notice].should == "No results found for this criteria"
    end
  end

end
