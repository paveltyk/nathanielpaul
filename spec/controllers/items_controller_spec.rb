require 'spec_helper'

describe ItemsController do
  let!(:collection) { create :collection }
  let!(:item) { create :collection_item, :collection => collection }

  describe '#show' do
    before { get :show, { :id => item.id, :collection_id => collection.id } }

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should_not set_the_flash }
  end
end