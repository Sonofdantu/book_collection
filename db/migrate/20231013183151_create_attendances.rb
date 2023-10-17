class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.string :email
      t.string :event_name

      t.timestamps
    end
  end
end
