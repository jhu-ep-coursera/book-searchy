class BooksController < ApplicationController
  def index
    @search_term = params[:looking_for] || 'cat in the hat'
    @books = Book.about(@search_term)

    # Substitute your amazon tag here
    @amazon_tag = 'jhu-ruby-coursera-20'
  end
end