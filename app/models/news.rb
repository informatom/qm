class News < ActiveRecord::Base
  attr_accessible :description, :name, :userstamps

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :description
end
