class RemoveWeeklyPointsFromMembers < ActiveRecord::Migration[6.1] # Adjust the version [6.1] as per your Rails version
  def change
    remove_column :members, :weeklyPoints
  end
end
