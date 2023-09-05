require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_collection_path
    
    fill_in 'book_collection[name]', with: 'Harry Potter'
    fill_in 'book_collection[description]', with: 'A wizard story'
    fill_in 'book_collection[author]', with: 'J.K. Rowling'
    fill_in 'book_collection[price]', with: '29.99'
    fill_in 'book_collection[published_date]', with: '2001-11-16' # Or however your date field works
    
    # If your checkbox works with direct interaction, you could also check it
    # check 'book_collection[read]'
    
    click_on 'Create Book'
    visit book_collections_path
    
    expect(page).to have_content('Harry Potter')
  end
end
