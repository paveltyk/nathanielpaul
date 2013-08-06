class Admin::ItemsController < Admin::BaseController
  before_filter :find_collection, only: [:show, :new, :create, :edit, :update]

  add_breadcrumb 'Dashboard', :admin_path
  add_breadcrumb 'Collections', :admin_collections_path

  def show
    @item = CollectionItem.find(params[:id])

    add_parent_collection_breadcrumb
    add_breadcrumb 'Items', admin_collection_item_path(@collection, @item)
  end

  def new
    @item = CollectionItem.new
    build_4_photos_for_item

    add_parent_collection_breadcrumb
    add_breadcrumb 'Add new item', new_admin_collection_item_path(@collection)
  end

  def edit
    @item = CollectionItem.find(params[:id])
    build_4_photos_for_item

    add_parent_collection_breadcrumb
    add_breadcrumb 'Item', admin_collection_item_path(@collection, @item)
    add_breadcrumb 'Add photos to item', edit_admin_collection_item_path(@collection, @item)
  end

  def create
    @item = @collection.items.build(item_params)

    if @item.save
      redirect_to admin_collection_item_path(@collection, @item), :notice => 'Item was successfully created.'
    else
      build_4_photos_for_item
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

  def find_collection
    @collection = Collection.find(params[:collection_id])
  end

  def item_params
    params.fetch(:collection_item, {}).permit(:photos_attributes => [:image, :active])
  end

  def build_4_photos_for_item
    4.times { @item.photos.build }
  end

  def add_parent_collection_breadcrumb
    add_breadcrumb @collection.name, admin_collection_path(@collection)
  end
end
