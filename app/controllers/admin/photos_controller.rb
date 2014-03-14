class Admin::PhotosController < Admin::BaseController
  def destroy
    @photo = Photo.find(params[:id]).destroy

    if CollectionItem.find_by_id(params[:item_id]).present?
      redirect_to admin_collection_item_path(params[:collection_id], params[:item_id]), :notice => 'Photo was successfully deleted.'
    else
      redirect_to admin_collection_path(params[:collection_id]), :notice => 'Item was successfully deleted.'
    end
  end

  def make_active
    @photo = Photo.find(params[:id]).make_active
    redirect_to admin_collection_item_path(params[:collection_id], params[:item_id])
  end
end
