class Substitution < ActiveRecord::Base
  has_paper_trail

  attr_accessible :deputy_id, :user_id, :company_id

  validates_presence_of :deputy
  validates_presence_of :user
  validates_uniqueness_of :deputy_id, :scope => [ :user_id, :company_id ]
  validates_presence_of :company

  belongs_to :user, :inverse_of => :substitutions
  belongs_to :deputy, :inverse_of => :substitutions
  belongs_to :company, :inverse_of => :substitutions
end