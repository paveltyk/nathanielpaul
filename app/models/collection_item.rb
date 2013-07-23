class CollectionItem < ActiveRecord::Base
  belongs_to :collection
  has_many :photos, :dependent => :destroy, :before_add => :set_collection_item_for_photo

  validates :collection, :presence => true
  validate :must_have_one_photo

  accepts_nested_attributes_for :photos, :allow_destroy => true

  def photos_empty?
    photos.empty? || photos.all? {|photo| photo.image.blank? }
  end

  private

  def must_have_one_photo
    errors.add(:photos, 'Colleciton item must have at least 1 photo') if photos_empty?
  end

  def set_collection_item_for_photo(photo)
    photo.collection_item = self
  end
end
