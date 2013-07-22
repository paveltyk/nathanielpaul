class Photo < ActiveRecord::Base
  attr_accessible :image, :active

  belongs_to :collection_item

  validates :collection_item, :image, :presence => true

  mount_uploader :image, ImageUploader
end
