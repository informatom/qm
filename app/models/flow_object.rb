class FlowObject < ActiveRecord::Base
  has_paper_trail

  attr_accessible :flow_object_class, :image_file_name, :name

  validates_presence_of :flow_object_class
  validates_presence_of :image_file_name
  validates_presence_of :name

  validates_uniqueness_of :name

  has_many :process_steps, :dependent => :restrict
  has_many :sequence_flows, :dependent => :restrict
end
