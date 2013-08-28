require 'spec_helper'

describe SearchController do
	describe "#index" do
		it "should render template" do
			get :index

			response.should render_template :index
		end
	end

end
