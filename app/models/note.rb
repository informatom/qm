class Note < ActiveRecord::Base
  has_paper_trail

  attr_accessible :company_id, :description, :name, :duration, :location, :medium, :archiving,
                  :business_process_note_assignments_attributes,
                  :note_process_step_assignments_attributes, :released_by_id, :controlled_by_id

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :company_id
  validates_presence_of :controlled_by
  validates_presence_of :released_by

  belongs_to :company
  belongs_to :controlled_by, :class_name => "User"
  belongs_to :released_by, :class_name => "User"

  has_many :business_process_note_assignments, :dependent => :restrict, :inverse_of => :note
  has_many :business_processes, :through => :business_process_note_assignments, :dependent => :restrict
  accepts_nested_attributes_for :business_process_note_assignments, :allow_destroy => true

  has_many :note_process_step_assignments, :dependent => :restrict, :inverse_of => :note
  has_many :process_steps, :through => :note_process_step_assignments, :dependent => :restrict
  accepts_nested_attributes_for :note_process_step_assignments, :allow_destroy => true
end