class Admin::ItemsController < Admin::BaseController
  def show
    @item = CollectionItem.find(params[:id])
  end

  def new
    @item = CollectionItem.new
    build_5_photos_for_item
  end

  def edit
    @item = CollectionItem.find(params[:id])
    build_5_photos_for_item
  end

  def create
    @collection = Collection.find(params[:collection_id])
    @item = @collection.items.build(item_params)

    if @item.save
      redirect_to admin_collection_item_path(@collection, @item), :notice => 'Item was successfully created.'
    else
      build_5_photos_for_item
      render :new
    end
  end

  def update
    @item = CollectionItem.find(params[:id])

    if @item.update_attributes(item_params)
      redirect_to admin_collection_item_path(@item.collection, @item), :notice => 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item = CollectionItem.find(params[:id]).destroy
    redirect_to admin_collection_items_path, :notice => 'Item was successfully deleted.'
  end

  private

  def item_params
    params.fetch(:collection_item, {}).permit(:photos_attributes => [:image, :active])
  end

  def build_5_photos_for_item
    5.times { @item.photos.build }
  end
end
