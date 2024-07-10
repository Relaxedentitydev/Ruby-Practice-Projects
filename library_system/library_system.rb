require_relative 'book'
require_relative 'library'

# Create instances of Book
book1 = Book.new("The Hobbit", "J.R.R. Tolkien", "1234567890")
book2 = Book.new("1984", "George Orwell", "9876543210")
book3 = Book.new("The Catcher in the Rye", "J.D. Salinger", "1928374650")

# Create an instance of Library
library = Library.new

# Add books to the library
library.add_book(book1)
library.add_book(book2)
library.add_book(book3)

# List all books
library.list_books

# Check out a book
library.check_out_book("1234567890")

# List all books to see the updated status
library.list_books

# Return a book
library.return_book("1234567890")

# List all books to see the updated status
library.list_books

# Remove a book
library.remove_book("9876543210")

# List all books to see the updated library
library.list_books
