class BooksController < ApplicationController
  def index
    @search_term = params[:looking_for] || 'cat in the hat'
    @books = Book.about(@search_term)

    # Substitute your amazon tag here
    @amazon_tag = 'jhu-ruby-coursera-20'

    map_isbn(@books)
  end

  private
    def map_isbn(books)
        books.each do |book|
          isbn10_item = book["volumeInfo"]["industryIdentifiers"].find { |it| it['type'] == 'ISBN_10' } if book["volumeInfo"]["industryIdentifiers"]
          book['isbn10'] = isbn10_item['identifier'] if isbn10_item
        end
    end
end