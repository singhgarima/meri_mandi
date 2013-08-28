require 'spec_helper'

describe District do
	it { should have_many(:markets) }
  it { should belong_to :state }
end
