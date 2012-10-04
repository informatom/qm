class AddCommentsToFunction < ActiveRecord::Migration
  def change
    add_column :functions, :comments, :text
  end
end
