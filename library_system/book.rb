class Book
  attr_reader :title, :author, :isbn

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
    @available = true
  end

  def check_out
    if @available
      @available = false
      puts "The book '#{@title}' has been checked out."
    else
      puts "The book '#{@title}' is already checked out."
    end
  end

  def return_book
    if @available
      puts "The book '#{@title}' was not checked out."
    else
      @available = true
      puts "The book '#{@title}' has been returned."
    end
  end

  def available?
    @available
  end  
end
