class SequenceFlow < ActiveRecord::Base
  has_paper_trail

  attr_accessible :flow_object_id, :name, :source_id, :target_id, :company_id

  validates_presence_of :source
  validates_presence_of :target
  validates_presence_of :flow_object_id

  belongs_to :company
  belongs_to :source, :class_name => "ProcessStep", foreign_key: "source_id"
  belongs_to :target, :class_name => "ProcessStep", foreign_key: "target_id"
  belongs_to :flow_object
end
