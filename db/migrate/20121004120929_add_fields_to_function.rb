class AddFieldsToFunction < ActiveRecord::Migration
  def change
    add_column :functions, :tasks, :text
    add_column :functions, :responsibilities, :text
    add_column :functions, :skills, :text
    add_column :functions, :goals, :text
    add_column :functions, :authorities, :text
  end
end
