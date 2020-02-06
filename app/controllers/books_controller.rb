class BooksController < ApplicationController
    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        @user = User.find(current_user.id)
        if @book.save
            redirect_to book_path(current_user.id)
        else
            render template: "users/show"
        end
    end

    def index
       @user = User.find(current_user.id)
       @books = Book.all
       @book = Book.new
    end

    def show
       @book = Book.new(book_params)
       @user = User.find(current_user.id)
    end

    def edit
    end

    private
    def book_params
        params.require(:book).permit(:title, :body)
    end

end
