require 'spec_helper'

describe "Admin Collections page" do
  before { basic_auth('admin', 'admin') }

  context 'visit /admin/collections' do
    before { visit admin_collections_path }

    it { page.status_code.should eq 200 }
  end

  describe 'create a new valid collection' do
    before do
      visit new_admin_collection_path
      fill_in 'Name', :with => 'New collection'
      click_button 'Save'
    end

    it { page.body.should have_content('Collection was successfully created.') }
    it { page.status_code.should eq 200 }
  end

  describe 'create a new invalid collection' do
    before do
      visit new_admin_collection_path
      fill_in 'Name', :with => nil
      click_button 'Save'
    end

    it { page.body.should have_selector('.collection_name .help-inline', :text => "can't be blank") }

    context 'then enter with valid data' do
      before do
        fill_in 'Name', :with => 'New collection'
        click_button 'Save'
      end

      it { page.body.should have_content('Collection was successfully created.') }
      it { page.status_code.should eq 200 }
    end
  end

  describe 'edit an existing collection' do
    let(:collection) { Collection.create :name => 'New collection', :active => true }

    before do
      visit edit_admin_collection_path(collection)
      fill_in 'Name', :with => 'Edited collection'
      uncheck 'Active'
      click_button 'Save'
      collection.reload
    end

    it { page.body.should have_content('Collection was successfully updated.') }
    it { collection.name.should eq 'Edited collection' }
    it { collection.active.should be_false }
  end
end
