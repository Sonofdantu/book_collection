class CreateOfficerEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :officer_entries do |t|
      t.integer :points
      t.string :email
      t.string :description

      t.timestamps
    end
  end
end
