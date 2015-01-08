require_relative 'Item.rb'

class DigitalItem < Item

	attr_accessor :name, :price, :download_size
	attr_reader :quantity

	def initialize name, price, download_size=0
		super(name, price)
		@quantity = 1
		@weight = -1
		@download_size = download_size
	end

	def stock amount
		false
	end

	def sell amount
		true
	end

	def return amount
		true
	end
end