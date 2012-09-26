class Employment < ActiveRecord::Base
  attr_accessible :company_id, :user_id

  belongs_to :user
  belongs_to :company
end
