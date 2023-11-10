class AddStatusToFinanceRequestsAndRemoveApprovedVariable < ActiveRecord::Migration[7.0]
  def change
    remove_column :finances, :resolved, :boolean
    add_column :finances, :status, :integer
  end
end
