class Collection < ActiveRecord::Base
  validates :name, :presence => true

  after_save :deactivate_active_collections, :if => 'active && active_changed?'

  has_many :items, :dependent => :destroy, :class_name => 'CollectionItem'

  def to_s
    name.presence || 'No Name'
  end

  private

  def deactivate_active_collections
    Collection.where(:active => true).where('id != ?', id).update_all(:active => false)
  end
end
