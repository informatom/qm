class Function < ActiveRecord::Base
  has_paper_trail

  attr_accessible :company_id, :name, :description, :comments, :tasks, :responsibilities, :skills, :goals, :authorities, :x, :y,
                  :user_function_assignments_attributes, :released_by_id, :controlled_by_id

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :company_id
  validates_presence_of :controlled_by
  validates_presence_of :released_by

  belongs_to :company
  belongs_to :controlled_by, :class_name => "User"
  belongs_to :released_by, :class_name => "User"

  has_many :user_function_assignments, :dependent => :restrict, :inverse_of => :function
  has_many :users, :through => :user_function_assignments, :dependent => :restrict, :inverse_of => :functions
  accepts_nested_attributes_for :user_function_assignments, :allow_destroy => true
end