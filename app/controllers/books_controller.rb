class BooksController < ApplicationController
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
            render template: "users/show"
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
        @book = Book.find(params[:id])
    end

    def update
        if book.update(user_params)
            flash[:notice] = "Book was successfully updated."
            redirect_to user_path(current_user.id)
        else
            render :edit
        end
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        flash[:notice] = "Book was successfully destroyed."
        redirect_to book_path(current_user.id)
    end

    private
    def book_params
        params.require(:book).permit(:title, :body)
    end

end
