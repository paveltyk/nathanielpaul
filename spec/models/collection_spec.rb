require 'spec_helper'

describe Collection do
  let(:collection) { create :collection }

  it { should validate_presence_of(:name) }

  it { collection.should be_valid }
end
