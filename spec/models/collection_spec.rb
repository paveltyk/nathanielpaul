require 'spec_helper'

describe Collection do
  subject { build :collection }

  it { should validate_presence_of(:name) }
  it { should be_valid }
end
