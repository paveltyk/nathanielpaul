class Photo < ActiveRecord::Base
  belongs_to :collection_item

  validates :collection_item, :image, :presence => true

  mount_uploader :image, ImageUploader

  scope :active_photos, ->(item_id) { where(:active => true).where(:collection_item_id => item_id) }

  def make_active
    Photo.active_photos(collection_item_id).update_all(:active => false)
    update_attributes(:active => true)
  end
end
