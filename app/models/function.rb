class Function < ActiveRecord::Base
  attr_accessible :company_id, :name, :description

  validates_presence_of :name
  validates_uniqueness_of :name

  belongs_to :company

  has_many :user_function_assignment, :dependent => :restrict
  has_many :users, :through => :user_function_assignment, :dependent => :restrict
end
