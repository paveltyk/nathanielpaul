require 'spec_helper'

describe FeedbacksController do
  describe :new do
    before { get :new }

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should_not set_the_flash }
  end

  describe :create do
    context :with_valid_params do
      let(:params) { { :feedback => { :email => 'user@example.com', :message => 'Message text' } } }

      before { post :create, params }

      it { should respond_with(:redirect) }
      it { response.should redirect_to(new_feedback_path) }
      it { flash[:notice].should eq('Thank you for contacting us. We have received your message and will respond shortly.') }
    end

    context :with_invalid_params do
      let(:params) { { :feedback => { :email => 'user@@example.com', :message => 'Message text' } } }

      before { post :create, params }

      it { should render_template(:new) }
    end
  end
end
