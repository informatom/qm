class Role < ActiveRecord::Base
  has_paper_trail

  attr_accessible :name

  has_many :assignments, :dependent => :restrict
  has_many :users, :through => :assignments, :dependent => :restrict

  validates_uniqueness_of :name
end
