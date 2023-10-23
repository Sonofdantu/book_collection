class SetDefaultValuesForMembers < ActiveRecord::Migration[7.0]
  def up
    change_column_default :members, :position, 'Member'
    change_column_default :members, :weeklyPoints, 0
    change_column_default :members, :totalPoints, 0
  end

  def down
    change_column_default :members, :position, nil
    change_column_default :members, :weeklyPoints, nil
    change_column_default :members, :totalPoints, nil
  end
end
