class Admin::ItemsController < Admin::BaseController
  def index
    @items = CollectionItem.order('created_at DESC')
  end

  def show
    @item = CollectionItem.find(params[:id])
  end

  def new
    @item = CollectionItem.new
  end

  def edit
    @item = CollectionItem.find(params[:id])
  end

  def create
    @collection = Collection.find(params[:collection_id])
    @item = @collection.items.build(params[:collection_item])

    if @item.save
      redirect_to admin_collection_item_path(@collection, @item), :notice => 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
    @item = CollectionItem.find(params[:id])

    if @item.update_attributes(params[:collection_item])
      redirect_to admin_collection_item_path(@item), :notice => 'Item was successfully updated.'
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
    # params.require(:collection_item).permit()
  end
end
