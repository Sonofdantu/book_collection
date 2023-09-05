class CreateBookCollection < ActiveRecord::Migration[7.0]
  def change
    create_table :book_collections do |t|
      t.string :name
      t.text :description
      t.boolean :read

      t.timestamps
    end
  end
end
