require 'spec_helper'

describe Admin::CollectionsController do
  before { http_login }

  let(:collection) { create :collection }

  describe '#index' do
    before { get :index }

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should_not set_the_flash }
  end

  describe '#show' do
    before { get :show, :id => collection.id }

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should_not set_the_flash }
  end

  describe '#new' do
    before { get :new }

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should_not set_the_flash }
  end

  describe '#edit' do
    before { get :edit, :id => collection.id }

    it { should respond_with(:success) }
    it { should render_template(:edit) }
    it { should_not set_the_flash }
  end

  describe '#create' do
    let(:params) { { :collection => {:name => 'Collection'}, :id => collection.id } }

    describe "with valid params" do
      before { post :create, params }

      it { should respond_with(:redirect) }
      it { should set_the_flash }
    end

    describe "with invalid params" do
      before do
        params[:collection][:name] = ''
        post :create, params
      end

      it { should render_template(:new) }
      it { should_not set_the_flash }
    end
  end

  describe '#update' do
    let(:params) { { :collection => { :name => 'Collection' }, :id => collection.id } }

    describe "with valid params" do
      before { post :update, params }

      it { should respond_with(:redirect) }
      it { should set_the_flash }
    end

    describe "with invalid params" do
      before do
        params[:collection][:name] = ''
        post :update, params
      end

      it { should render_template(:edit) }
      it { should_not set_the_flash }
    end
  end

  describe '#destroy' do
    before { post :destroy, :id => collection.id }

    it { should respond_with(:redirect) }
    it { should redirect_to(admin_collections_path) }
    it { should set_the_flash }
    it { Collection.count.should be 0 }
  end
end
