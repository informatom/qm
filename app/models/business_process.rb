class BusinessProcess < ActiveRecord::Base
  has_ancestry
  has_paper_trail

  attr_accessible :aims, :ancestry, :company_id, :description, :name, :number, :owner_id, :parent_id, :process_class_id, :purpose,
                  :x, :y, :area,
                  :business_process_note_assignments_attributes,
                  :business_process_document_assignments_attributes,
                  :business_process_process_indicator_assignments_attributes,
                  :business_process_department_assignments_attributes, :released_by_id, :controlled_by_id

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :company_id
  validates_presence_of :process_class_id
  validates_presence_of :controlled_by
  validates_presence_of :released_by

  belongs_to :company
  belongs_to :process_class
  belongs_to :owner, :class_name => "User"
  belongs_to :controlled_by, :class_name => "User"
  belongs_to :released_by, :class_name => "User"

  has_many :business_process_note_assignments, :dependent => :restrict, :inverse_of => :business_process
  has_many :notes, :through => :business_process_note_assignments, :dependent => :restrict, :inverse_of => :business_processes
  accepts_nested_attributes_for :business_process_note_assignments, :allow_destroy => true

  has_many :business_process_document_assignments, :dependent => :restrict, :inverse_of => :business_process
  has_many :documents, :through => :business_process_document_assignments, :dependent => :restrict, :inverse_of => :business_processes
  accepts_nested_attributes_for :business_process_document_assignments, :allow_destroy => true

  has_many :business_process_process_indicator_assignments, :dependent => :restrict, :inverse_of => :business_process
  has_many :process_indicators, :through => :business_process_process_indicator_assignments, :dependent => :restrict, :inverse_of => :business_processes
  accepts_nested_attributes_for :business_process_process_indicator_assignments, :allow_destroy => true

  has_many :business_process_department_assignments, :dependent => :restrict, :inverse_of => :business_process
  has_many :departments, :through => :business_process_department_assignments, :dependent => :restrict, :inverse_of => :business_processes
  accepts_nested_attributes_for :business_process_department_assignments, :allow_destroy => true

  has_many :process_steps

  def duplicate(company_id: nil, parent_id: nil)
    new_business_process = self.dup
    new_business_process.company_id = company_id
    new_business_process.legacy_id = self.id

    pcs = ProcessClass.where(legacy_id: self.process_class_id, company_id: company_id)
    return unless pcs.any?

    new_business_process.process_class_id = pcs.first.id

    new_business_process.parent_id = parent_id
    new_business_process.owner_id ||= BusinessProcess.find(parent_id).owner_id
    new_business_process.released_by_id ||= new_business_process.owner_id  
    new_business_process.controlled_by_id ||= new_business_process.owner_id  
    debugger unless new_business_process.save

    self.children.each do |child|
      child.duplicate(company_id: company_id, parent_id: id)
    end
  end 
end