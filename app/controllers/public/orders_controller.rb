class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @select_address = params[:order][:select_address]
    @order = Order.new(order_params)
    @order.amount_billed = 800 + @cart_items.sum(&:subtotal)

    if @select_address == "0"

      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif  @select_address == "1"

      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif @select_address == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end

  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800
    @order.save!
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_items = @order.order_items.new
      @order_items.item_id = cart_item.item.id
      @order_items.amount = cart_item.amount
      @order_items.price_tax_included = cart_item.item.add_tax_price
      @order.save
    end
    @cart_items.destroy_all
    redirect_to orders_thanx_path
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :amount_billed )
  end


end



