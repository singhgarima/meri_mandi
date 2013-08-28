require 'spec_helper'

describe Variety do
	it { should have_many(:commodity_prices) }
end
