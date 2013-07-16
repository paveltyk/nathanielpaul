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
      let(:params) { { :feedback => { :email => 'user@example.com', :subject => 'Subject', :message => 'Message text' } } }

      before { post :create, params }

      it { should respond_with(:redirect) }
      it { response.should redirect_to(contact_path) }
      it { flash[:notice].should eq('Thank you. Your message was successfully sent!') }
    end

    context :with_invalid_params do
      let(:params) { { :feedback => { :email => 'user@@example.com', :subject => '', :message => 'Message text' } } }

      before { post :create, params }

      it { should render_template(:new) }
    end
  end
end
