class ProcessStep < ActiveRecord::Base
  has_paper_trail

  attr_accessible :company_id, :created_by, :description, :business_process_id, :title, :flow_object_id, :updated_by,
                  :outgoing_sequence_flows_attributes,
                  :incoming_sequence_flows_attributes,
                  :instruction_process_step_assignments_attributes,
                  :note_process_step_assignments_attributes,
                  :document_process_step_assignments_attributes

  validates_presence_of :company
  validates_presence_of :description
  validates_presence_of :created_by
  validates_presence_of :updated_by
  validates_presence_of :business_process_id
  validates_presence_of :title
  validates_presence_of :flow_object_id

  belongs_to :company, :inverse_of => :process_steps
  belongs_to :business_process, :inverse_of => :process_steps
  belongs_to :creator, :class_name => "User", foreign_key: "created_by"
  belongs_to :updator, :class_name => "User", foreign_key: "updated_by"
  belongs_to :flow_object

  has_many :successors, :through => :outgoing_sequence_flows, :dependent => :restrict,
           :source => :target, :inverse_of => :predecessors
  has_many :outgoing_sequence_flows, :class_name => "SequenceFlow", :dependent => :restrict, :foreign_key => "source_id",
           :dependent => :restrict, :inverse_of => :source
  accepts_nested_attributes_for :outgoing_sequence_flows, :allow_destroy => true

  has_many :predecessors, :through => :incoming_sequence_flows, :dependent => :restrict,
           :source => :source, :inverse_of => :successors
  has_many :incoming_sequence_flows, :class_name => "SequenceFlow", :dependent => :restrict, :foreign_key => "target_id",
           :dependent => :restrict, :inverse_of => :target
  accepts_nested_attributes_for :incoming_sequence_flows, :allow_destroy => true

  has_many :instruction_process_step_assignments, :dependent => :restrict, :inverse_of => :process_step
  has_many :instructions, :through => :instruction_process_step_assignments, :dependent => :restrict,
           :inverse_of => :process_steps
  accepts_nested_attributes_for :instruction_process_step_assignments, :allow_destroy => true

  has_many :note_process_step_assignments, :dependent => :restrict, :inverse_of => :process_step
  has_many :notes, :through => :note_process_step_assignments, :dependent => :restrict, :inverse_of => :process_steps
  accepts_nested_attributes_for :note_process_step_assignments, :allow_destroy => true

  has_many :document_process_step_assignments, :dependent => :restrict, :inverse_of => :process_step
  has_many :documents, :through => :document_process_step_assignments, :dependent => :restrict,
           :inverse_of => :process_steps
  accepts_nested_attributes_for :document_process_step_assignments, :allow_destroy => true
end