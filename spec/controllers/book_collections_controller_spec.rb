# location: spec/controllers/book_collections_controller_spec.rb

require 'rails_helper'

RSpec.describe BookCollectionsController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates the book and redirects to the book index page with a flash message' do
        post :create, params: {
          book_collection: {
            name: 'Harry Potter',
            description: 'A wizard story',
            read: true,
            author: 'J.K. Rowling',
            price: 29.99,
            published_date: Date.new(1997,6,26)
          }
        }
        expect(response).to redirect_to(book_collections_path)
        expect(flash[:notice]).to eq('Harry Potter was successfully created.')
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new book and sets a flash message' do
        post :create, params: {
          book_collection: {
            name: '',
            description: 'A wizard story',
            read: true,
            author: 'J.K. Rowling',
            price: 29.99,
            published_date: Date.new(1997,6,26)
          }
        }
        expect(response).to render_template('new')
        expect(flash[:alert]).to eq("Book couldn't be created. Please check the errors.")
      end
    end
  end
end
