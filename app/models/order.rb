class Order < ApplicationRecord
  enum payment_method: {credit_card: 0, transfer: 1}
  enum order_status: {wating_payment: 0, confirm_payment: 1, making: 2, preparing_shipping: 3, finish_shipping: 4}

  has_many :order_items
  belongs_to :customer

  def total_amount
    @total = 0
    self.order_items.each do |order_item|
      @total += order_item.amount
    end
    return @total
  end


end
