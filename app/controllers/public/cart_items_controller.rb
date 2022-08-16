class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @total_price = 0
  end

  def update
  end

  def destroy
  end

  def all_destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
     @cart_item.save
     redirect_to cart_items_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
