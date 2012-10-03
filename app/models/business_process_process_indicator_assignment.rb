class BusinessProcessProcessIndicatorAssignment < ActiveRecord::Base
  attr_accessible :business_process_id, :company_id, :process_indicator_id

  validates_presence_of :process_indicator_id
  validates_presence_of :business_process_id
  validates_uniqueness_of :process_indicator_id, :scope => :business_process_id
  validates_presence_of :company_id

  belongs_to :business_process
  belongs_to :process_indicator
  belongs_to :company
end
