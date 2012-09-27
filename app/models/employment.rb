class Employment < ActiveRecord::Base
  attr_accessible :company_id, :user_id

  validates_presence_of :company_id
  validates_presence_of :user_id
  validates_uniqueness_of :company_id, :scope => :user_id

  belongs_to :user
  belongs_to :company
end
