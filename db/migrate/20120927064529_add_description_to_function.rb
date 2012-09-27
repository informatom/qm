class AddDescriptionToFunction < ActiveRecord::Migration
  def change
    add_column :functions, :description, :text
  end
end
