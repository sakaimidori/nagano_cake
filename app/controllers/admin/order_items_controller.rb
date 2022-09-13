class Admin::OrderItemsController < ApplicationController



  def update
    #管理者／注文詳細画面の制作ステータス更新
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    if @order_item.product_status == "making"
      @order_item.order.update(order_status: 2)
    end
     @order = @order_item.order
     @order_items = @order.order_items
    if @order.order_items.where(product_status:"finish_making").count == @order.order_items.count
      @order_item.order.update(order_status: 3)
    end
    redirect_to admin_order_path(@order_item.order)
  end

  def order_item_params
    params.require(:order_item).permit(:product_status)
  end


end
