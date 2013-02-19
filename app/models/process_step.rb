class ProcessStep < ActiveRecord::Base
  attr_accessible :company_id, :created_by, :description, :business_process_id, :title, :flow_object_id, :updated_by
  
  validates_presence_of :company
  validates_presence_of :description
  validates_presence_of :created_by
  validates_presence_of :updated_by
  validates_presence_of :business_process_id
  validates_presence_of :title
  validates_presence_of :flow_object_id

  belongs_to :company
  belongs_to :business_process
  belongs_to :creator, :class_name => "User", foreign_key: "created_by"
  belongs_to :updator, :class_name => "User", foreign_key: "updated_by"
  belongs_to :flow_object
end
