class CreateSubstitutions < ActiveRecord::Migration
  def change
    create_table :substitutions do |t|
      t.integer :user_id
      t.integer :deputy_id

      t.timestamps
    end
  end
end
