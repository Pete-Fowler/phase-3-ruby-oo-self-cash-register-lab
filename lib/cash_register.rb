require 'pry'


class CashRegister 
  attr_reader :discount, :items
  attr_accessor :total

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
    @last_transaction = []
  end

  def add_item(title, price, qty = 1)
    @total += price * qty
    qty.times do 
      @items.push(title)
    end
    @last_transaction = price * qty
  end

  def apply_discount 
    if discount == 0
      "There is no discount to apply."
    else
      @total -= @total * discount / 100
      "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction 
    @total -= @last_transaction
  end

end
