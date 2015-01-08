require_relative 'spec_helper'
require_relative '../lib/Cd'

describe Cd do

  before(:context) do
    @cd = Cd.new "Generic Name", 10.99
    @cd2 = Cd.new "Generic Name", 10.99, 2
  end

  #check inilization
  describe "Initialize" do
  	it "Initialize Name" do
  		expect(@cd.name).to eq("Generic Name")
  	end
  		it "Initialize Price" do
  		expect(@cd.price).to eq(10.99)
  	end
    it "is assigned a weight" do
      expect(@cd.weight).to eq(0)
      @cd.weight = 5
      expect(@cd.weight).to eq(5)
    end
    it "Initialize Cd2" do
      expect(@cd2.name).to eq("Generic Name")
      expect(@cd2.price).to eq(10.99)
      expect(@cd2.weight).to eq(2)
    end
  end
  #check that it is an extended from Item
  describe "Extended" do
  	it "checks to see if Cd is extended from Item" do
  		expect(@cd).to be_kind_of(Item)
  		# expect(Cd.superclass).to eq(Item)
  	end
  end
  #check that it is an instance of Cd
  describe "Instance of" do
  	it "checks to see if it is an instance of Cd" do
  		expect(@cd).to be_instance_of(Cd)
  	end
  end
  #check getters and setters
  describe "Get/Set" do
  	it "should be able to get and set price" do
  		@cd.price = 8.99
  		expect(@cd.price).to eq(8.99)
  	end
  	it "should be able to get and set name" do
  		@cd.name = "New Band"
  		expect(@cd.name).to eq("New Band")
  	end
  	it "should check quantity" do
  		expect(@cd.quantity).to eq(0)
  	end
  	it "should get and set description" do
  		expect(@cd.description).to eq("")
  		@cd.description = "A description"
  		expect(@cd.description).to eq("A description")
  	end
  	it "should get and set artist" do
  		expect(@cd.artist).to eq("")
  		@cd.artist = "An artist"
  		expect(@cd.artist).to eq("An artist")
  	end
  	it "should get and set tracks" do
  		expect(@cd.tracks).to eq(0)
  		@cd.tracks = 12
  		expect(@cd.tracks).to eq(12)
  	end
  	it "should get and set tracks" do
  		expect(@cd.run_time).to eq(0)
  		@cd.run_time = 60
  		expect(@cd.run_time).to eq(60)
  	end
  end
 #Methods
  describe "Methods" do
    it "should be able to stock" do
      result = @cd.stock 5
      expect(result).to eq(true)
      expect(@cd.quantity).to eq(5)
    end
    it "should not be able to sell more items than we have" do
      result = @cd.sell 6
      expect(result).to eq(false)
      expect(@cd.quantity).to eq(5)
    end
    it "should be able to sell items and update quantity" do
      result = @cd.sell 3
      expect(result).to eq(true)
      expect(@cd.quantity).to eq(2)
    end
    it "should be able to return items and update quantity" do
      result = @cd.return 3
      # expect(result).to eq(true)
      expect(@cd.quantity).to eq(5)
    end
    it "should set shipping cost" do 
      @cd.weight = 2
      result = @cd.ship_price
      expect(result).to eq(2.4)
    end 
  end
end


