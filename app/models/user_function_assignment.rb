class UserFunctionAssignment < ActiveRecord::Base
  attr_accessible :function_id, :user_id, :company_id

  validates_presence_of :function
  validates_presence_of :user
  validates_uniqueness_of :function_id, :scope => :user_id
  validates_presence_of :company_id

  belongs_to :function
  belongs_to :user
  belongs_to :company
end
