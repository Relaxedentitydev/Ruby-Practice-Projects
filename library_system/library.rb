require_relative 'book'

class Library
  def initialize
    @books = []
  end

  def add_book(book)
    @books<< book
    puts "Added '#{book.title}' by #{book.author} to the library."
  end

  def remove_book(isbn)
    book = @books.find {|b| b.isbn == isbn }
    if book
      @books.delete(book)
      puts "Removed '#{book.title}' by #{book.author} from the library."
    else
      puts "Book not found."
    end
  end

  def list_books
    if @books.empty?
      puts "No books available in the library."
    else
      puts "Available books in the library:"
      @books.each do |book|
        puts "#{book.title} by #{book.author} (ISBN: #{book.isbn}) - #{book.available? ? 'Available' : 'Checked Out'}"
      end
    end
  end

  def check_out_book(isbn)
    book = @books.find {|b| b.isbn == isbn }
    if book
      book.check_out
    else
      puts "Book not found."
    end
  end

  def return_book(isbn)
    book = @books.find {|b| b.isbn == isbn }
    if book
      book.return_book
    else
      puts "Book not found."
    end
  end

end
