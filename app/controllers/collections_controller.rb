class CollectionsController < ApplicationController
  def show
    @collection = Collection.find_by_active(true, :include => {:items => :active_photo})
  end
end
