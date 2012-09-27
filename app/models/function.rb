class Function < ActiveRecord::Base
  attr_accessible :company_id, :name, :description

  validates_presence_of :name
  validates_uniqueness_of :name
  belongs_to :company
  has_and_belongs_to_many :users
end
