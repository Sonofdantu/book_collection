class SetDefaultOfficerPointsForMembers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :members, :officer_points, 0
  end
end
