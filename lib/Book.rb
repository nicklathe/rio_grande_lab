require_relative 'Item.rb'
class Book < Item

	attr_accessor :name, :price, :author, :pages

    def initialize name, price, weight=0
        super(name,price,weight)
        @author = ""
        @pages = 0
    end
end