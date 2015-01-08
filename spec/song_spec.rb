require_relative 'spec_helper'
require_relative '../lib/Song'

describe Song do

	before(:context) do
    @song = Song.new "Song Name", 0.99
    @song2 = Song.new "Another name", 1.99, 58
  end

  #check inilization
	describe "Initialize" do
  	it "Initialize Name" do
  		expect(@song.name).to eq("Song Name")
  	end
  	it "Initialize Price" do
  		expect(@song.price).to eq(0.99)
  	end
    it "Initialize for Song2" do
      expect(@song2.name).to eq("Another name")
      expect(@song2.price).to eq(1.99)
      expect(@song2.download_size).to eq(58)
    end
  end

  #check that it is an instance of Song
  describe "Instance of" do
  	it "checks to see if it is an instance of Song" do
  		expect(@song).to be_instance_of(Song)
  	end
  end

  #check that it is an extended from Item
  describe "Extended" do
  	it "checks to see if Song is extended from DigitalItem" do
  		expect(@song).to be_kind_of(Item)
  		# expect(Song.superclass).to eq(DigitalItem)
  	end
  end

  #check getters and setters
  describe "Get/Set" do
  	it "should be able to get and set price" do
  		@song.price = 5.99
  		expect(@song.price).to eq(5.99)
  	end
  	it "should be able to get and set name" do
  		@song.name = "New Name"
  		expect(@song.name).to eq("New Name")
  	end
  	it "should be able to get and set run time" do
  		@song.run_time = 30
  		expect(@song.run_time).to eq(30)
  	end
  	it "should be able to get and set artist" do
  		@song.artist = "New Artist"
  		expect(@song.artist).to eq("New Artist")
  	end
  end

  #Methods
  describe "Methods" do
    it "should be able to stock" do
      result = @song.stock 5
      expect(result).to eq(false)
      expect(@song.quantity).to eq(1)
    end
    it "should to sell regardless of quantity" do
      result = @song.sell 6
      expect(result).to eq(true)
      expect(@song.quantity).to eq(1)
    end
    it "should be able to return items and not update quantity" do
      result = @song.return 5
      expect(result).to eq(true)
      expect(@song.quantity).to eq(1)
    end
    it "should not get ship price" do
      expect(@song.ship_price).to eq(false)
    end
  end
end