class Role < ActiveRecord::Base
  has_paper_trail

  attr_accessible :name

  has_many :assignments, :dependent => :restrict, :inverse_of => :role
  has_many :users, :through => :assignments, :dependent => :restrict, :inverse_of => :roles

  validates_uniqueness_of :name
end
