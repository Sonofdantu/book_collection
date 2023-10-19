class AddOfficerPointsToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :officer_points, :integer
  end
end
