class ProcessIndicator < ActiveRecord::Base
  attr_accessible :company_id, :description, :metering_point, :name, :nominal_value, :operator, :unit, :value

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :company_id

  belongs_to :company

  has_many :business_process_process_indicator_assignments, :dependent => :restrict
  has_many :business_processes, :through => :business_process_process_indicator_assignments, :dependent => :restrict
end
