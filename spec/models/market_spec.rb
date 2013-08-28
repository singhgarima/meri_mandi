require 'spec_helper'

describe Market do
	it { should have_many(:commodity_prices) }
end
