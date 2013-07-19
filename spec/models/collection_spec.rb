require 'spec_helper'

describe Collection do
  subject { build :collection }

  it { should validate_presence_of(:name) }
  it { should be_valid }

  describe 'deactivate_active_collections' do
    let!(:collection) { create :collection, :active => true }

    it { collection.active.should be_true }

    context 'create another active collection' do
      let!(:another_active_collection) { create :collection }

      it 'first collection should be deactivated' do
        collection.reload
        collection.active.should be_false
      end

      it 'another collection should be active' do
        another_active_collection.active.should be_true
      end
    end
  end
end
