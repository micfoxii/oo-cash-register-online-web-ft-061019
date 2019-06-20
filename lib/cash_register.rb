require 'pry'

class CashRegister
  attr_accessor :total, :discount, :quantity, :price
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
  end
  
  def add_item (item_name, price, quantity = 1)
    @total += price*quantity
    @transactions << price
    until quantity == 0 do
     @items << item_name
     quantity -= 1 
   end
  end
  
  def apply_discount
    if @discount > 0 
      @discount = @discount/100.to_f 
      @total = @total - (@total*@discount)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end
  
  def items
    @items
  end
  
  def void_last_transaction
    total_less_refund =  @total - @transactions.pop
    @transactions << total_less_refund 
    @total = @transactions.pop 
  end
    
end
