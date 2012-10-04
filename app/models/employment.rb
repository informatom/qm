class Employment < ActiveRecord::Base
  attr_accessible :company_id, :user_id

  validates_presence_of :company_id
  validates_presence_of :user
  validates_uniqueness_of :company_id, :scope => :user_id

  belongs_to :user
  accepts_nested_attributes_for :user

  belongs_to :company

  scope :in_company, lambda { |company_id| where(:company_id => company_id) }
end
