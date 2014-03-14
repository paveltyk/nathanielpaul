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
      end

      it { CollectionItem.find_by_id(item.id).should be_nil }
      it { should redirect_to(admin_collection_path(collection)) }
      it { should set_the_flash }
    end
  end
end
