class UserFunctionAssignment < ActiveRecord::Base
  attr_accessible :function_id, :user_id

  belongs_to :function
  belongs_to :user
end
