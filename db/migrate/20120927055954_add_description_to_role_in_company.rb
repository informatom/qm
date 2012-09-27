class AddDescriptionToRoleInCompany < ActiveRecord::Migration
  def change
    add_column :roles_in_company, :description, :text
  end
end
