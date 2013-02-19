class CreateFlowObjects < ActiveRecord::Migration
  def change
    create_table :flow_objects do |t|
      t.string :name
      t.string :class
      t.string :image_file_name

      t.timestamps
    end
  end
end
