class CollectionItem < ActiveRecord::Base
  belongs_to :collection

  validates :collection, :presence => true
end
