class OrderItem < ApplicationRecord

  enum product_status: {impossible_making: 0, wating_making: 1, making: 2, finish_making: 3}

  belongs_to :order
  belongs_to :item

  def subtotal
    item.add_tax_price * amount
  end


end
