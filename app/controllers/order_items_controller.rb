require 'pizza_app_logger'
class OrderItemsController < ApplicationController
  def create
  if(current_order.order_status_id == 2) 
    @order=Order.new
    @order_item = @order.order_items.new(order_item_params)
  else
    @order = current_order
    @order_item = @order.order_items.where(product_id: params[:order_item][:product_id]).first
    if @order_item.present?
     @order_item.update_attributes(quantity: params[:order_item][:quantity])
    else
     @order_item = @order.order_items.new(order_item_params)
    end
  end
    @order.order_status_id = 1
    @order.save
    #MemberMailer.order_email(@order).deliver
    session[:order_id] = @order.id
    logger = MyLogger.instance
    logger.orderInformation(@order.subtotal.to_s)
    respond_to do |format|
  format.js
end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    @order.save
    respond_to do |format|
  format.js
end
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    @order.save
    respond_to do |format|
  format.js
end
  end
private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
