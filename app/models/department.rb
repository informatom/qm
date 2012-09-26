class Department < ActiveRecord::Base
  attr_accessible :company_id, :name

  validates_presence_of :name
  validates_uniqueness_of :name
  belongs_to :company
  has_many :department_affiliations
  has_many :users, :through => :department_affiliations
end
