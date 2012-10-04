class AddFieldsToNote < ActiveRecord::Migration
  def change
    add_column :notes, :duration, :string
    add_column :notes, :location, :string
    add_column :notes, :medium, :string
    add_column :notes, :archiving, :string
  end
end
