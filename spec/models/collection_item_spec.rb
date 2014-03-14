require 'spec_helper'

describe CollectionItem do
  let(:collection_item) { create :collection_item }

  it { should have_db_index(:collection_id) }

  it { should belong_to(:collection) }
  it { should have_many(:photos).dependent(:destroy) }

  it { should validate_presence_of(:collection) }

  context 'active photo' do
    it { collection_item.photos.count.should eq 1 }
    it { Photo.active_photos(collection_item.id).should be }
  end
end
