require 'spec_helper'

describe Admin::ItemsController do
  before { http_login }

  let!(:collection) { create :collection }
  let!(:item) { create :collection_item, :collection => collection }

  describe '#show' do
    before { get :show, { :id => item.id, :collection_id => collection.id } }

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should_not set_the_flash }
  end

  describe '#new' do
    before { get :new, :collection_id => collection.id }

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should_not set_the_flash }
  end

  describe '#edit' do
    before { get :edit, { :id => item.id, :collection_id => collection.id } }

    it { should respond_with(:success) }
    it { should render_template(:edit) }
    it { should_not set_the_flash }
  end

  describe '#create' do
    let(:params) { { :collection_item => attributes_for(:collection_item).merge(:photos_attributes => [{ :image => photo_image_params }]), :collection_id => collection.id, :id => item.id } }

    describe "with valid params" do
      before { post :create, params }

      it { should respond_with(:redirect) }
      it { should set_the_flash }
    end

    describe "with invalid params" do
      before do
        params[:collection_item][:photos_attributes] = nil
        post :create, params
      end

      it { should render_template(:new) }
      it { should_not set_the_flash }
    end
  end

  describe '#update' do
    let(:params) { { :collection_item => attributes_for(:collection_item).merge(:photos_attributes => [{ :image => photo_image_params }]), :collection_id => collection.id, :id => item.id } }

    describe "with valid params" do
      before { post :update, params }

      it { should respond_with(:redirect) }
      it { should set_the_flash }
    end
  end

  describe '#destroy' do
    subject { post :destroy, { :id => item.id, :collection_id => collection.id } }

    it { expect { subject }.to change(CollectionItem, :count).by(-1) }
    it { subject.should redirect_to(admin_collection_items_path) }
  end
end
