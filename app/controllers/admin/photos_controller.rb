class Admin::PhotosController < Admin::BaseController
  def destroy
    @photo = Photo.find(params[:id]).destroy
    redirect_to admin_collection_item_path(params[:collection_id], params[:item_id]), :notice => 'Item was successfully deleted.'
  end

  def make_active
    @photo = Photo.find(params[:id]).make_active
    redirect_to admin_collection_item_path(params[:collection_id], params[:item_id])
  end
end
