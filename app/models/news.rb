class News < ActiveRecord::Base
  has_paper_trail

  attr_accessible :description, :name, :userstamps

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :description
end
