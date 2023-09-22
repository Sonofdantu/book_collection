# app/models/book_collection.rb

class BookCollection < ApplicationRecord
    # Your model code here
    validates :name, presence: true
    validates :author, presence: true
    validates :price, presence: true, numericality: true
    validates :published_date, presence: true
end
  