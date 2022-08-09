class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image

  def add_tax_price
    (self.price * 1.10).round
  end

  def get_item_image(width,height)
    item_image.variant(resize_to_limit:[width,height])
  end

end
