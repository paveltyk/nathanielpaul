require 'spec_helper'

describe RootController do
  describe '#landing' do
    render_views

    before { get :landing }

    it { should respond_with(:success) }
    it { should render_template(:landing) }
    it { should_not set_the_flash }
  end

  describe '#about' do
    render_views

    before { get :about }

    it { should respond_with(:success) }
    it { should render_template(:about) }
    it { should_not set_the_flash }
  end
end
