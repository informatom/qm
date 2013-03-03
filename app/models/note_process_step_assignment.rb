class NoteProcessStepAssignment < ActiveRecord::Base
  attr_accessible :company_id, :note_id, :process_step_id

  validates_presence_of :note_id
  validates_presence_of :process_step_id
  validates_uniqueness_of :note_id, :scope => :process_step_id
  validates_presence_of :company_id

  belongs_to :note
  belongs_to :process_step
  belongs_to :company
end
