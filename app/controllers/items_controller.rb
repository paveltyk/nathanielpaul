class ItemsController < ApplicationController
  def show
    @item = CollectionItem.find(params[:id])

    respond_to do |format|
      format.html { render partial: 'popup' if request.xhr? }
    end
  end
end
