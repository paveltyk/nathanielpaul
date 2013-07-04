require 'spec_helper'

describe RootController do
  describe '#landing' do
    before { get :landing }

    it { should respond_with(:success) }
    it { should render_template(:landing) }
    it { should_not set_the_flash }
  end

  describe '#about' do
    before { get :about }

    it { should respond_with(:success) }
    it { should render_template(:about) }
    it { should_not set_the_flash }
  end

   describe '#contact' do
    before { get :contact }

    it { should respond_with(:success) }
    it { should render_template(:contact) }
    it { should_not set_the_flash }
  end
end
