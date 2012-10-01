class AddCompanyIdToSubstitution < ActiveRecord::Migration
  def change
    add_column :substitutions, :company_id, :integer
  end
end
