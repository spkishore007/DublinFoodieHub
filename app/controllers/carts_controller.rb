class CartsController < ApplicationController
before_action :set_order, only: [:confirmed,:canceled]

 def show
    @order_items = current_order.order_items
 end

 def confirmed
 	@order.order_status_id = 2
 	@order.save!
 	redirect_to order_payment_confirmation_path
 end
 
  def payment_confirmation
     @order = current_order
  end

 def canceled
   	current_order.order_status_id = 4
   	current_order.order_items.each do |order_item|
    order_item.delete
    end
    @order_items = current_order.order_items
    current_order.save
    @order = current_order
 end

 private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:order_id])
    end
end
