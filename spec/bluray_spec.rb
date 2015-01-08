require_relative 'spec_helper'
require_relative '../lib/Bluray'

describe Bluray do

  before(:context) do
    @bluray = Bluray.new "Bluray Name", 5.99
    @bluray2 = Bluray.new "Some Title", 7.99, 2
  end

  #check inilization
  describe "Initialize" do
  	it "Initialize Name" do
  		expect(@bluray.name).to eq("Bluray Name")
  	end
  	it "Initialize Price" do
  		expect(@bluray.price).to eq(5.99)
  	end
    it "is assigned a weight" do
      expect(@bluray.weight).to eq(0)
      @bluray.weight = 5
      expect(@bluray.weight).to eq(5)
    end
    it "Initialize bluray2" do
      expect(@bluray2.name).to eq("Some Title")
      expect(@bluray2.price).to eq(7.99)
      expect(@bluray2.weight).to eq(2)
    end
  end
  #check that it is an extended from Item
  describe "Extended" do
  	it "checks to see if bluray is extended from Item" do
  		expect(@bluray).to be_kind_of(Item)
  		# expect(Bluray.superclass).to eq(Item)
  	end
  end
  #check that it is an instance of Bluray
  describe "Instance of" do
  	it "checks to see if it is an instance of Item" do
  		expect(@bluray).to be_instance_of(Bluray)
  	end
  end
  #check getters and setters
  describe "Get/Set" do
  	it "should be able to get and set price" do
  		@bluray.price = 10.99
  		expect(@bluray.price).to eq(10.99)
  	end
  	it "should be able to get and set name" do
  		@bluray.name = "New Name"
  		expect(@bluray.name).to eq("New Name")
  	end
  	it "should be able to get and set run time" do
  		expect(@bluray.run_time).to eq(0)
  		@bluray.run_time = 20
  		expect(@bluray.run_time).to eq(20)
  	end
  	it "should be able to get and set run director" do
  		expect(@bluray.director).to eq("")
  		@bluray.director = "New Director"
  		expect(@bluray.director).to eq("New Director")
  	end
  	it "should be able to get and set run producer" do
  		expect(@bluray.producer).to eq("")
  		@bluray.producer = "New producer"
  		expect(@bluray.producer).to eq("New producer")
  	end
  end
  #Methods
  describe "Methods" do
    it "should be able to stock" do
      result = @bluray.stock 5
      expect(result).to eq(true)
      expect(@bluray.quantity).to eq(5)
    end
    it "should not be able to sell more items than we have" do
      result = @bluray.sell 6
      expect(result).to eq(false)
      expect(@bluray.quantity).to eq(5)
    end
    it "should be able to sell items and update quantity" do
      result = @bluray.sell 3
      expect(result).to eq(true)
      expect(@bluray.quantity).to eq(2)
    end
    it "should be able to return items and update quantity" do
      result = @bluray.return 3
      # expect(result).to eq(true)
      expect(@bluray.quantity).to eq(5)
    end
    it "should set shipping cost" do 
      @bluray.weight = 2
      result = @bluray.ship_price
      expect(result).to eq(2.4)
    end 
  end
end