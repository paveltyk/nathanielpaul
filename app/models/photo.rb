class Photo < ActiveRecord::Base
  belongs_to :collection_item

  validates :collection_item, :image, :presence => true

  after_destroy :ensure_item_photos_presence

  mount_uploader :image, ImageUploader

  scope :active_photos, ->(item_id) { where(:active => true).where(:collection_item_id => item_id) }

  def make_active
    self.transaction do
      Photo.active_photos(collection_item_id).update_all(:active => false)
      update_attributes(:active => true)
    end
  end

  private

  def ensure_item_photos_presence
    collection_item.destroy unless collection_item.photos.present?
  end
end
