
class CashRegister
    attr_accessor :discount, :total, :items, :recent

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
        @recent = []
    end

    def add_item(title, price, quantity = 0)        
            if quantity > 0
            quantity.times do 
                self.items << title
            end
            self.recent << price * quantity
            self.total += price * quantity
        else
        self.recent << price
        self.total += price
        self.items << title
        end 
    end

    def apply_discount
        if self.discount > 0
            self.total -= (self.discount.to_f / 100) * self.total
            return "After the discount, the total comes to $#{self.total.to_i}."
        else 
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
         a = self.recent.pop
         a = a.to_f
        self.total -= a
    end



end 