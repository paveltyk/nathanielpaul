require 'spec_helper'

describe CollectionsController do
  let(:collection) { create :collection }

  describe :show do
    before { get :show, :id => collection.id }

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should_not set_the_flash }
  end
end
