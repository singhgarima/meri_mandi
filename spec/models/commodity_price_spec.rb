require 'spec_helper'

describe CommodityPrice do
	it { should belong_to(:variety) }
	it { should belong_to(:market) }
end
