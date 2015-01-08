require_relative 'spec_helper'
require_relative '../lib/EBook'

describe EBook do 

	before(:context) do
    @ebook = EBook.new "Generic Name", 2.99
    @ebook2 = EBook.new "Some name", 5.99, 85
  end

  #check inilization
	describe "Initialize" do
  	it "Initialize Name" do
  		expect(@ebook.name).to eq("Generic Name")
  	end
  	it "Initialize Price" do
  		expect(@ebook.price).to eq(2.99)
  	end
    it "Initialize download_size for ebook2" do
      expect(@ebook2.name).to eq("Some name")
      expect(@ebook2.price).to eq(5.99)
      expect(@ebook2.download_size).to eq(85)
    end
  end

  #check that it is an instance of EBook
  describe "Instance of" do
  	it "checks to see if it is an instance of EBook" do
  		expect(@ebook).to be_instance_of(EBook)
  	end
  end
  #check that it is an extended from Item
  describe "Extended" do
  	it "checks to see if EBook is extended from DigitalItem" do
  		expect(@ebook).to be_kind_of(Item)
  		# expect(EBook.superclass).to eq(DigitalItem)
  	end
  end

  #check getters and setters
  describe "Get/Set" do
  	it "should be able to get and set price" do
  		@ebook.price = 5.99
  		expect(@ebook.price).to eq(5.99)
  	end
  	it "should be able to get and set name" do
  		@ebook.name = "New Name"
  		expect(@ebook.name).to eq("New Name")
  	end
  	it "should check quantity" do
  		expect(@ebook.quantity).to eq(1)
  	end
  	it "should be able to get and set pages" do
  		expect(@ebook.pages).to eq(0)
  		@ebook.pages = 200
  		expect(@ebook.pages).to eq(200)
  	end
  	it "should be able to get and set author" do
  		expect(@ebook.author).to eq("")
  		@ebook.author = "New Author"
  		expect(@ebook.author).to eq("New Author")
  	end
  end

  #Methods
  describe "Methods" do
    it "should be able to stock" do
      result = @ebook.stock 5
      expect(result).to eq(false)
      expect(@ebook.quantity).to eq(1)
    end
    it "should to sell regardless of quantity" do
      result = @ebook.sell 6
      expect(result).to eq(true)
      expect(@ebook.quantity).to eq(1)
    end
    it "should be able to return items and not update quantity" do
      result = @ebook.return 5
      expect(result).to eq(true)
      expect(@ebook.quantity).to eq(1)
    end
    it "should not get ship price" do
      expect(@ebook.ship_price).to eq(false)
    end
  end
end