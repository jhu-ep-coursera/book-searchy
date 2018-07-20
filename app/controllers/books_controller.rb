class BooksController < ApplicationController
  def index
    @search_term = params[:looking_for] || 'cat in the hat'
    @books = Book.about(@search_term)
  end
end