require 'spec_helper'

describe Admin::DashboardController do
  describe 'login with valid credentials' do
    before { http_login }

    context 'GET #index' do
      before { get :index }

      it 'should be successful' do
        response.should be_success
      end
    end
  end

  describe 'login without credentials' do
    context 'GET #index' do
      before { get :index }

      it 'should be 401' do
        response.status.should be 401
      end
    end
  end
end
