class Photo < ActiveRecord::Base
  belongs_to :collection_item

  validates :collection_item, :image, :presence => true

  mount_uploader :image, ImageUploader
end
