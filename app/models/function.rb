class Function < ActiveRecord::Base
  has_paper_trail

  attr_accessible :company_id, :name, :description, :comments, :tasks, :responsibilities, :skills, :goals, :authorities, :x, :y,
                  :user_function_assignments_attributes

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :company_id

  belongs_to :company

  has_many :user_function_assignments, :dependent => :restrict, :inverse_of => :function
  has_many :users, :through => :user_function_assignments, :dependent => :restrict
  accepts_nested_attributes_for :user_function_assignments, :allow_destroy => true
end
