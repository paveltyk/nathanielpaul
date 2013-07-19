class Collection < ActiveRecord::Base
  validates :name, :presence => true

  after_save :deactivate_active_collections, :if => 'active && active_changed?'

  private

  def deactivate_active_collections
    Collection.where(:active => true).where('id != ?', id).update_all(:active => false)
  end
end
