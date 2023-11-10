class AddAttendanceVisibleToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :attendanceVisible, :boolean
  end
end
