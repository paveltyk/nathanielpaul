class CollectionItem < ActiveRecord::Base
  belongs_to :collection
  has_many :photos, :dependent => :destroy

  validates :collection, :presence => true
end
