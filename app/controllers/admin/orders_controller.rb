class Admin::OrdersController < ApplicationController

before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order.update(order_params)
    if @order.order_status == "confirm_payment"
      @order_items.update(product_status: 1)
    end
    redirect_to admin_order_path(@order)
  end


  private

  def order_params
    params.require(:order).permit(:order_status)
  end


end
