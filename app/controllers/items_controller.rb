class ItemsController < ApplicationController
  def show
    @item = CollectionItem.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf
    end
  end
end
