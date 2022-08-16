class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  has_one_attached :image

  #消費税の計算
  def add_tax_price
    (self.price * 1.10).floor
  end


  def get_item_image(width,height)
    image.variant(resize_to_limit: [width, height]).processed

  end

end
