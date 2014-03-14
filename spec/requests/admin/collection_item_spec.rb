require 'spec_helper'

describe 'Admin Collection item page' do
  before { basic_auth('admin', 'admin') }

  let(:collection) { create :collection }

  context 'visit /admin/collection/:id' do
    before { visit admin_collection_path(collection) }

    it { page.status_code.should eq 200 }
  end

  describe 'create a new valid collection item' do
    before do
      visit new_admin_collection_item_path(collection)
      attach_file('collection_item[photos_attributes][0][image]', File.join(Rails.root, '/spec/files/rails.png'))
      click_button 'Save'
    end

    it { page.body.should have_content('Item was successfully created.') }
    it { page.status_code.should eq 200 }
  end

  describe 'create a new invalid collection item' do
    before do
      visit new_admin_collection_item_path(collection)
      click_button 'Save'
    end

    it { page.body.should have_content('Colleciton item must have at least 1 photo') }

    context 'then enter with valid data' do
      before do
        attach_file('collection_item[photos_attributes][0][image]', File.join(Rails.root, '/spec/files/rails.png'))
        click_button 'Save'
      end

      it { page.body.should have_content('Item was successfully created.') }
      it { page.status_code.should eq 200 }
    end
  end

  describe 'add photos to existing collection item' do
    let(:item) { create :collection_item, :collection => collection }

    context 'firstly item has 1 photo' do
      it { item.photos.count.should eq 1 }
    end

    context 'delete last photo' do
      before do
        visit admin_collection_item_path(collection, item)
        click_link 'Delete'
        collection.reload
      end

      it { page.body.should have_content('Item was successfully deleted.') }
      it { CollectionItem.find_by_id(item.id).should be_nil }
    end

    context 'add second photo to item' do
      before do
        @item_photos = item.photos.order('created_at ASC')
        visit edit_admin_collection_item_path(collection, item)
        attach_file('collection_item[photos_attributes][4][image]', File.join(Rails.root, '/spec/files/rails.png'))
        click_button 'Save'
        collection.reload
      end

      it { @item_photos.count.should eq 2 }
      it { page.body.should have_content('Item was successfully updated.') }
      it { page.status_code.should eq 200 }

      context 'active photo in collection item' do

        it { @item_photos.first.should_not eq @item_photos.last }

        context 'should be first' do
          it { @item_photos.first.active?.should be_true }
        end

        context 'change active photo' do
          before do
            visit admin_collection_item_path(collection, item)
            find("a[href='#{admin_collection_item_photo_path(collection, item, @item_photos.last)}/make_active']").click
            collection.reload
          end

          it { item.photos.order('created_at ASC').first.active?.should be_false }
          it { item.photos.order('created_at ASC').last.active?.should be_true }
        end
      end
    end
  end
end
