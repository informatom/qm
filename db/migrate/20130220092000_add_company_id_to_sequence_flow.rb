class AddCompanyIdToSequenceFlow < ActiveRecord::Migration
  def change
    add_column :sequence_flows, :company_id, :integer
  end
end
