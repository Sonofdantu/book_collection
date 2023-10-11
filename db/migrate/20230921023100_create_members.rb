class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.integer :totalPoints
      t.integer :weeklyPoints
      t.string :nameFirst
      t.string :nameLast
      t.string :position
      t.boolean :attended

      t.timestamps
    end
  end
end
