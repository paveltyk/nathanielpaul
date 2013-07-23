class CollectionItem < ActiveRecord::Base
  belongs_to :collection
  has_many :photos, :dependent => :destroy, :before_add => :set_collection_item_for_photo

  validates :collection, :presence => true

  accepts_nested_attributes_for :photos, :allow_destroy => true

  private

  def set_collection_item_for_photo(photo)
    photo.collection_item = self
  end
end
