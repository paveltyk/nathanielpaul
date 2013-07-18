class Admin::CollectionsController < Admin::BaseController
  def index
    @collections = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def new
    @collection = Collection.new
  end

  def edit
    @collection = Collection.find(params[:id])
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