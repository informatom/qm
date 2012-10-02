class BusinessProcess < ActiveRecord::Base
  has_ancestry

  attr_accessible :aims, :ancestry, :company_id, :description, :name, :number, :owner_id, :parent_id, :process_class_id, :purpose

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :company_id

  belongs_to :company
  belongs_to :process_class
  belongs_to :owner, :class_name => "User"
end
