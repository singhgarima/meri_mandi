require 'spec_helper'

describe Commodity do
	it { should have_many(:varieties) }
end
