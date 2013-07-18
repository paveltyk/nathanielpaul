class Collection < ActiveRecord::Base
  attr_accessible :name, :active

  validates :name, :presence => true
end
