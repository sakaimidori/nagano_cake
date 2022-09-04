class Admin::OrdersController < ApplicationController



  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    #@order_item = OrderItem.find(params[:id])
    #@order_item.update(order_item_params)
    redirect_to admin_order_path(@order)
  end


  private

  def order_params
    params.require(:order).permit(:order_status)
  end

  
end
