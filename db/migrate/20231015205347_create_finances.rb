class CreateFinances < ActiveRecord::Migration[7.0]
  def change
    create_table :finances do |t|
      t.string :email
      t.string :eventTitle
      t.decimal :cost
      t.text :receipt
      t.text :reimbursement
      t.boolean :resolved
      t.string :description

      t.timestamps
    end
  end
end
