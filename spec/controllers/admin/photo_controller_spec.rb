require 'spec_helper'

describe Admin::PhotosController do
  before { http_login }

  let(:collection) { create :collection }
  let(:item) { create :collection_item, :collection => collection }
  let(:photo) { item.photos.last }

  describe '#destroy' do
    let(:params) { { :id => photo.id, :collection_id => collection.id, :item_id => item.id } }

    it { item.photos.count.should eq 1 }

    context do
      before do
        post :destroy, params
        item.reload
      end

      it { item.photos.count.should eq 0 }
      it { should redirect_to(admin_collection_item_path(collection, item)) }
      it { should set_the_flash }
    end
  end
end
