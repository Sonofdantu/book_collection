class RemoveAttendedFromMembers < ActiveRecord::Migration[7.0]
  def change
    remove_column :members, :attended
  end
end
