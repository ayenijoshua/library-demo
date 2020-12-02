class BookController < ApplicationController

    #list all books
    def list
        @books = Book.all
    end
    
    #show single book
    def show
        @book = Book.find(params[:id])
    end
    
    #create new book
    def new
        @book = Book.new
        @subjects = Subject.all 
    end
    
    #load create view
    def create
        @book = Book.new(book_params)

        if @book.save
            redirect_to :action => 'list'
        else
            @subjects = Subject.all
            render :action => 'new'
        end
    end

    #book http parameters
    def book_params
        params.require(:books).permit(:title, :price, :subject_id, :description)
     end
    
    #load edit view
    def edit
        @book = Book.find(params[:id])
        @subjects = Subject.all
    end
    
    #update a book
    def update
        @book = Book.find(params[:id])

        if @book.update_attributes(book_params)
            redirect_to :action => 'show', :id => @book
        else
            render :action => 'edit'
        end
    end
    
    #delete book
    def delete
        Book.find(params[:id]).destroy
        redirect_to :action => 'list'
    end

    def show_subjects
        @subject = Subject.find(params[:id])
     end
end
