class BusinessProcess < ActiveRecord::Base
  has_ancestry

  attr_accessible :aims, :ancestry, :company_id, :description, :name, :number, :owner_id, :parent_id, :process_class_id, :purpose,
                  :x, :y

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :company_id
  validates_presence_of :process_class_id

  belongs_to :company
  belongs_to :process_class
  belongs_to :owner, :class_name => "User"

  has_many :business_process_note_assignments, :dependent => :restrict
  has_many :notes, :through => :business_process_note_assignments, :dependent => :restrict

  has_many :business_process_document_assignments, :dependent => :restrict
  has_many :documents, :through => :business_process_document_assignments, :dependent => :restrict

  has_many :business_process_process_indicator_assignments, :dependent => :restrict
  has_many :process_indicators, :through => :business_process_process_indicator_assignments, :dependent => :restrict

  has_many :business_process_department_assignments, :dependent => :restrict
  has_many :departments, :through => :business_process_department_assignments, :dependent => :restrict
end
