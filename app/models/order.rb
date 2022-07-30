class Order < ApplicationRecord
  enum payment_method: {credit_card: 0, transfer: 1}
  enum order_status: {wating_payment: 0, confirm_payment: 1, making: 2, preparing_shipping: 3, finish_shipping: 4}
end
