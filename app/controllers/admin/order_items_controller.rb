class Admin::OrderItemsController < ApplicationController

  def update
    #管理者／注文詳細画面(ステータス編集を兼ねる)の制作ステータス更新

    #@order = Order.find(params[:id])
    #@order.update(order_params)

    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    redirect_to admin_order_path(@order_item.order)
  end

  def order_item_params
    params.require(:order_item).permit(:product_status)
  end


end
