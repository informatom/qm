class InstructionProcessStepAssignment < ActiveRecord::Base
  has_paper_trail

  attr_accessible :company_id, :instruction_id, :process_step_id

  validates_presence_of :instruction
  validates_presence_of :process_step
  validates_uniqueness_of :instruction_id, :scope => :process_step_id
  validates_presence_of :company_id

  belongs_to :instruction
  belongs_to :process_step
  belongs_to :company
end