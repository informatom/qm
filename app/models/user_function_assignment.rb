class UserFunctionAssignment < ActiveRecord::Base
  attr_accessible :function_id, :user_id, :company_id

  validates_presence_of :function_id
  validates_presence_of :user_id
  validates_uniqueness_of :function_id, :scope => [:user_id, :company_id]

  belongs_to :function
  belongs_to :user
  belongs_to :company
end
