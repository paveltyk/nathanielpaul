require 'spec_helper'

describe FeedbackController do
  describe '#new' do
    before { get :new }

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should_not set_the_flash }
  end
end
