class Note < ActiveRecord::Base
  attr_accessible :company_id, :description, :name, :duration, :location, :medium, :archiving

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :company_id

  belongs_to :company

  has_many :business_process_note_assignments, :dependent => :restrict
  has_many :business_processes, :through => :business_process_note_assignments, :dependent => :restrict
end
