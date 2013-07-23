class Admin::PhotosController < Admin::BaseController
  def destroy
    @photo = Photo.find(params[:id]).destroy
    redirect_to admin_collection_item_path(params[:collection_id], params[:item_id]), :notice => 'Item was successfully deleted.'
  end
end
