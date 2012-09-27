class Department < ActiveRecord::Base
  attr_accessible :company_id, :name

  validates_presence_of :name
  validates_uniqueness_of :name

  belongs_to :company
  has_many :department_affiliations, :dependent => :restrict
  has_many :users, :through => :department_affiliations, :dependent => :restrict
end
