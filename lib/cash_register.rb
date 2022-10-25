require "pry"

class CashRegister
    attr_accessor :total, :title, :discount, :price, :quantity, :all_items, :all_prices

    def initialize (discount = nil)
        @discount = discount
        @total = 0
        @all_items = []
        @all_prices = []
    end

    def add_item (title, price, quantity = nil)
        @title = title
        @price = price
        @quantity = quantity
        @last_price = 0

        if quantity.to_i == 0
            @all_items << title
            @last_price = price
            @total += price
          else
            quantity.to_i.times {@all_items << title}
            @last_price = price * quantity.to_i
            @total += price * quantity.to_i
          end
    end

    def apply_discount
        if discount
            self.discount = self.discount.to_i
            self.total = self.total - (self.total * self.discount/100)
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @all_items
    end

    def void_last_transaction
        @total -= @last_price

    end
end

cash = CashRegister.new(20)
cash.add_item("tomato", 1.76, 2)
# p cash.apply_discount
# p cash.all_items.slice(0...-1)
p cash.void_last_transaction