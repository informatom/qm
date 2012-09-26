class Substitution < ActiveRecord::Base
  attr_accessible :deputy_id, :user_id

  belongs_to :user
  belongs_to :deputy
end
