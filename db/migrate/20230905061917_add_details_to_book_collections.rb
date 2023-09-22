class AddDetailsToBookCollections < ActiveRecord::Migration[7.0]
  def change
    add_column :book_collections, :author, :string
    add_column :book_collections, :price, :decimal
    add_column :book_collections, :published_date, :date
  end
end
