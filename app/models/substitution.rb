class Substitution < ActiveRecord::Base
  has_paper_trail

  attr_accessible :deputy_id, :user_id, :company_id

  validates_presence_of :deputy
  validates_presence_of :user
  validates_uniqueness_of :deputy_id, :scope => [ :user_id, :company_id ]
  validates_presence_of :company_id

  belongs_to :user
  belongs_to :deputy
  belongs_to :company
end
