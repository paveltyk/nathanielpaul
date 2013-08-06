class Admin::CollectionsController < Admin::BaseController
  add_breadcrumb 'Dashboard', :admin_path
  add_breadcrumb 'Collections', :admin_collections_path

  def index
    @collections = Collection.order('created_at DESC')
  end

  def show
    @collection = Collection.find(params[:id])

    add_breadcrumb @collection.name, admin_collection_path(@collection)
  end

  def new
    @collection = Collection.new(:active => true)

    add_breadcrumb 'New collection', new_admin_collection_path
  end

  def edit
    @collection = Collection.find(params[:id])

    add_breadcrumb @collection.name, admin_collection_path(@collection)
    add_breadcrumb 'Edit', edit_admin_collection_path(@collection)
  end

  def create
    @collection = Collection.new(collection_params)

    if @collection.save
      redirect_to admin_collection_path(@collection), :notice => 'Collection was successfully created.'
    else
      render :new
    end
  end

  def update
    @collection = Collection.find(params[:id])

    if @collection.update_attributes(collection_params)
      redirect_to admin_collection_path(@collection), :notice => 'Collection was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @collection = Collection.find(params[:id]).destroy
    redirect_to admin_collections_path, :notice => 'Collection was successfully deleted.'
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :active)
  end
end
