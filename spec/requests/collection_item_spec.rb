require 'spec_helper'

describe 'Collection item page' do
	let!(:collection) { create :collection }
  	let!(:item) { create :collection_item, :collection => collection }

  	context 'visit /collection/items/:id' do
    	before { visit collection_item_path(item) }
    	it { page.status_code.should eq 200 }
 	end
end
