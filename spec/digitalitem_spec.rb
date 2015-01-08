require_relative 'spec_helper'
require_relative '../lib/DigitalItem'

describe DigitalItem do 

	before(:context) do
    @digital_item = DigitalItem.new "Generic Name", 5.99
  end
  #check inilization
	describe "Initialize" do
  	it "Initialize Name" do
  		expect(@digital_item.name).to eq("Generic Name")
  	end
  		it "Initialize Price" do
  		expect(@digital_item.price).to eq(5.99)
  	end
  end
  #check that it is an extended from Item
  describe "Extended" do
  	it "checks to see if DigitalItem is extended from Item" do
  		expect(@digital_item).to be_kind_of(Item)
  		# expect(DigitalItem.superclass).to eq(Item)
  	end
  end
  #check that it is an instance of DigitalItem
  describe "Instance of" do
  	it "checks to see if it is an instance of DigitalItem" do
  		expect(@digital_item).to be_instance_of(DigitalItem)
  	end
  end
  #check getters and setters
  describe "Get/Set" do
  	it "should be able to get and set price" do
  		@digital_item.price = 9.99
  		expect(@digital_item.price).to eq(9.99)
  	end
  	it "should be able to get and set name" do
  		@digital_item.name = "New Band"
  		expect(@digital_item.name).to eq("New Band")
  	end
  	it "should check quantity" do
  		expect(@digital_item.quantity).to eq(1)
  	end
  end
end