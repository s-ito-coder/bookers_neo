class BooksController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @books = Book.all
        if @book.save
            flash[:notice] = "Book was successfully created."
            redirect_to book_path(@book)
        else
            @user = User.find(current_user.id)
            render :index
        end
    end

    def index
        @user = User.find(current_user.id)
        @users = User.all
        @books = Book.all
        @book = Book.new
    end

    def show
        @book = Book.find(params[:id])
        @user = @book.user
        @book_new = Book.new
        @books = Book.all
    end

    def edit
        @user = User.find(current_user.id)
        @book = Book.find(params[:id])
    end

    def update
        book = Book.find(params[:id])
        if book.update(book_params)
            flash[:notice] = "Book was successfully updated."
            redirect_to book_path(params[:id])
        else
            @book = book
            render :edit
        end
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        flash[:notice] = "Book was successfully destroyed."
        @book = Book.new
        redirect_to books_path
    end

    private
    def book_params
        params.require(:book).permit(:title, :body)
    end

    def correct_user
      book = Book.find(params[:id])
      if book.user.id != current_user.id
         redirect_to books_path
      end
    end
end
