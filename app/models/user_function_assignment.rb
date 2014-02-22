class UserFunctionAssignment < ActiveRecord::Base
  has_paper_trail

  attr_accessible :function_id, :user_id, :company_id

  validates_presence_of :function
  validates_presence_of :user
  validates_uniqueness_of :function_id, :scope => :user_id
  validates_presence_of :company_id

  belongs_to :function, :inverse_of => :user_function_assignments
  belongs_to :user, :inverse_of => :user_function_assignments
  belongs_to :company, :inverse_of => :user_function_assignments
end
