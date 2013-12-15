class ProcessClass < ActiveRecord::Base
  has_paper_trail

  attr_accessible :company_id, :description, :name, :color

  validates_presence_of :name
  validates_presence_of :color
  validates_uniqueness_of :name, :scope => :company_id

  belongs_to :company
  has_many :business_processes, :dependent => :restrict
end
