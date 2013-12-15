class Submission < ActiveRecord::Base
  has_paper_trail

  attr_accessible :name, :email, :message, :answer

begin
  def self.columns() @columns ||= []; end

  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end

  column :name, :string
  column :email, :string
  column :message, :text
  column :answer, :string
end

  validates_presence_of :name, :email, :answer

  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_format_of :answer, :with => %r{8}, :message => "ist falsch - Sind Sie ein Roboter?"
end
