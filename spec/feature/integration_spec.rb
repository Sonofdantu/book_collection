require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_collection_path
    fill_in 'book_collection[name]', with: 'harry potter' # assuming your field is named 'name'
    click_on 'Create Book'
    visit book_collections_path
    expect(page).to have_content('harry potter')
  end
end
