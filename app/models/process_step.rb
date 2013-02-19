class ProcessStep < ActiveRecord::Base
  attr_accessible :company_id, :created_by, :description, :business_process_id, :title, :type_id, :updated_by
  
  validates_presence_of :company
  validates_presence_of :description
  validates_presence_of :created_by
  validates_presence_of :updated_by
  validates_presence_of :business_process_id
  validates_presence_of :title
  validates_presence_of :type_id

  belongs_to :company
end
