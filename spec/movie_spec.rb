require_relative 'spec_helper'
require_relative '../lib/Movie'

describe Movie do

	before(:context) do
    @movie = Movie.new "Movie Name", 9.99
    @movie2 = Movie.new "Another name", 12.99, 100
  end

  #check inilization
	describe "Initialize" do
  	it "Initialize Name" do
  		expect(@movie.name).to eq("Movie Name")
  	end
  	it "Initialize Price" do
  		expect(@movie.price).to eq(9.99)
  	end
    it "Initialize movie2" do
      expect(@movie2.name).to eq("Another name")
      expect(@movie2.price).to eq(12.99)
      expect(@movie2.download_size).to eq(100)
    end
  end

  #check that it is an instance of Movie
  describe "Instance of" do
  	it "checks to see if it is an instance of Movie" do
  		expect(@movie).to be_instance_of(Movie)
  	end
  end

  #check that it is an extended from Item
  describe "Extended" do
  	it "checks to see if Movie is extended from DigitalItem" do
  		expect(@movie).to be_kind_of(Item)
  		# expect(Movie.superclass).to eq(DigitalItem)
  	end
  end

  #check getters and setters
  describe "Get/Set" do
  	it "should be able to get and set price" do
  		@movie.price = 5.99
  		expect(@movie.price).to eq(5.99)
  	end
  	it "should be able to get and set name" do
  		@movie.name = "New Name"
  		expect(@movie.name).to eq("New Name")
  	end
  	it "should check quantity" do
  		expect(@movie.quantity).to eq(1)
  	end
  	it "should be able to get and set run_time" do
  		expect(@movie.run_time).to eq(0)
  		@movie.run_time = 120
  		expect(@movie.run_time).to eq(120)
  	end
  	it "should be able to get and set director" do
  		expect(@movie.director).to eq("")
  		@movie.director = "New director"
  		expect(@movie.director).to eq("New director")
  	end
  	it "should be able to get and set producer" do
  		expect(@movie.producer).to eq("")
  		@movie.producer = "New producer"
  		expect(@movie.producer).to eq("New producer")
  	end
  end

  #Methods
  describe "Methods" do
    it "should be able to stock" do
      result = @movie.stock 5
      expect(result).to eq(false)
      expect(@movie.quantity).to eq(1)
    end
    it "should to sell regardless of quantity" do
      result = @movie.sell 6
      expect(result).to eq(true)
      expect(@movie.quantity).to eq(1)
    end
    it "should be able to return items and not update quantity" do
      result = @movie.return 5
      expect(result).to eq(true)
      expect(@movie.quantity).to eq(1)
    end
    it "should not get ship price" do
      expect(@movie.ship_price).to eq(false)
    end
  end
end 