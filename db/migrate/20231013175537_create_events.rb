class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.integer :score
      t.string :password
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
