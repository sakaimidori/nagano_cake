class CartItem < ApplicationRecord

   belongs_to :item
   belongs_to :customer

  def subtotal
    item.add_tax_price * amount
  end

  def amount_options
    options = []
    (self.amount+10).times do |count|
      options << ["#{count+1}個", count+1]
    end
    return options
  end


end

