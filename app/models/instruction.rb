class Instruction < ActiveRecord::Base
  attr_accessible :company_id, :controlled_by_id, :created_by, :ecology, :in_charge_id, :necessary_information, :number, :on_deviation, 
                  :released_by_id, :ressources, :revision_date, :scope_id, :security, :tasks, :title, :updated_by

  has_paper_trail

  validates_presence_of :title
  validates_uniqueness_of :title, :scope => :company_id

  validates_presence_of :controlled_by
  validates_presence_of :in_charge
  validates_presence_of :released_by
  validates_presence_of :tasks

  belongs_to :company

  belongs_to :in_charge, :class_name => "User"
  belongs_to :controlled_by, :class_name => "User"
  belongs_to :released_by, :class_name => "User"
  belongs_to :scope, :class_name => "Department"
  belongs_to :creator, :class_name => "User", foreign_key: "created_by"
  belongs_to :updator, :class_name => "User", foreign_key: "updated_by"

  has_many :instruction_process_step_assignments, :dependent => :restrict
  has_many :process_steps, :through => :instruction_process_step_assignments, :dependent => :restrict
end
