# app/models/book_collection.rb

class BookCollection < ApplicationRecord
    # Your model code here
    validates :name, presence: true
end
  