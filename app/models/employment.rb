class Employment < ActiveRecord::Base
  has_paper_trail

  attr_accessible :company_id, :user_id

  validates_presence_of :company
  validates_presence_of :user
  validates_uniqueness_of :user_id, :scope => :company_id

  belongs_to :user
  belongs_to :company

  scope :in_company, lambda { |company_id| where(:company_id => company_id) }
end
