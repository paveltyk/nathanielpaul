require 'spec_helper'

describe "Front-end Collection page" do
  describe 'Collection does not exist' do
    before { visit collection_path }

    it { page.status_code.should eq 200 }
  end

  describe 'Collection without items' do
    let!(:collection) { Collection.create :name => 'New collection' }

    before { visit collection_path }

    it { page.status_code.should eq 200 }
  end
end
