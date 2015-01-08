require_relative 'spec_helper'
require_relative '../lib/Book'

describe Book do

  before(:context) do
    @book = Book.new "A Clockwork Orange", 9.99
    @book2 = Book.new "Some Title", 7.99, 2
  end

  #check inilization
  describe "Inilization" do
  	it "read book name" do
  		expect(@book.name).to eq("A Clockwork Orange")
  	end
    it "read book price" do
      expect(@book.price).to eq(9.99)
    end
    it "is assigned a weight" do
      expect(@book.weight).to eq(0)
      @book.weight = 5
      expect(@book.weight).to eq(5)
    end
    it "Inilization for Book2" do
      expect(@book2.name).to eq("Some Title")
      expect(@book2.price).to eq(7.99)
      expect(@book2.weight).to eq(2)
    end
  end
  #check that it is an extended from Item
  describe "Book extended" do
  	it "should check to see if book is extended from Item" do
  		# expect(Book.superclass).to eq Item
  		expect(@book).to be_kind_of(Item)
  	end
  end
  #check that it is an instance of Book
  describe "Instance of Book" do
  	it "should check to see that it is an instance of Book" do
  		expect(@book).to be_instance_of Book
  	end
  end
  #check getters and setters
  describe "Get/Set Price" do
  	it "should be able to get and set price" do
  		@book.price = 12.99
  		expect(@book.price).to eq(12.99)
  	end
    it "should be able to get and set name" do
      @book.name = "New Name"
      expect(@book.name).to eq("New Name")
    end
    it "should be able to get and set author name" do
      expect(@book.author).to eq("")
      @book.author = "Author Name"
      expect(@book.author).to eq("Author Name")
    end
    it "should be able to get and set number of pages" do
      @book.pages = 350
      expect(@book.pages).to eq(350)
    end
    it "should be able to get quantity" do
      expect(@book.quantity).to eq(0)
    end
    it "should be able to get and set description" do
      @book.description = "This is a description"
      expect(@book.description).to eq("This is a description")
    end
  end
  #Methods
  describe "Methods" do
    it "should be able to stock" do
      result = @book.stock 5
      expect(result).to eq(true)
      expect(@book.quantity).to eq(5)
    end
    it "should not be able to sell more items than we have" do
      result = @book.sell 6
      expect(result).to eq(false)
      expect(@book.quantity).to eq(5)
    end
    it "should be able to sell items and update quantity" do
      result = @book.sell 3
      expect(result).to eq(true)
      expect(@book.quantity).to eq(2)
    end
    it "should be able to return items and update quantity" do
      result = @book.return 3
      expect(result).to eq(true)
      expect(@book.quantity).to eq(5)
    end
    it "should set shipping cost" do 
      @book.weight = 2
      result = @book.ship_price
      expect(result).to eq(2.4)
      # expect(result).to eq(true)
    end 
  end
end