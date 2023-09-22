class BookCollectionsController < ApplicationController
    def index
      @book_collections = BookCollection.order(:id) # Assuming you want to order by ID
    end
  
    def show
      @book = BookCollection.find(params[:id])
    end
  
    def new
      @book = BookCollection.new
    end
  
    # app/controllers/book_collections_controller.rb

def create
  @book = BookCollection.new(book_collection_params)
  if @book.save
    flash[:notice] = "#{@book.name} was successfully created."
    redirect_to book_collections_path
  else
    flash[:alert] = "Book couldn't be created. Please check the errors."
    render 'new'
  end
end

    
  
    def edit
      @book = BookCollection.find(params[:id])
    end
    
  
    def delete
      @book = BookCollection.find(params[:id])
    end
  
    def update
      @book = BookCollection.find(params[:id])
      if @book.update(book_collection_params)
        flash[:notice] = "#{@book.name} successfully updated."
        redirect_to book_collections_path
      else
        render 'edit'
      end
    end
    
    
    def destroy
      @book = BookCollection.find(params[:id])
      book_name = @book.name # Store the name before destroying the record
      if @book.destroy
        flash[:notice] = "#{book_name} was successfully deleted."
      else
        flash[:alert] = "Failed to delete #{book_name}."
      end
      redirect_to book_collections_path
    end
    
    
    private
    def book_collection_params
      params.require(:book_collection).permit(:name, :description, :read, :author, :price, :published_date)
    end    
  end
  