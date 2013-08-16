class ItemsController < ApplicationController
  def show
    @item = CollectionItem.find(params[:id])
  end
end
