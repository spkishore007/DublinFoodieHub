require 'product_update_single'
require 'pricing_observer'
class OrderObserver
  def update(record)
      
    if record.order_status.name == "Confirmed"
      puts("***********************qwerrty")
       MemberMailer.order_email(@order).deliver
     	record.order_items.each do |order_item|
         order_item.product.update_attribute(:quantityAvailable,order_item.product.quantityAvailable.to_i - order_item.quantity) 
        end
      product_count_update
      price_change
    end
  end
  
  def product_count_update
    @product_count = ProductUpdateSingleton.instance
    @count_up = @product_count.count_update
    puts(@count_up)
  end
  
  def product_refresh_qty
    @refresh = ProductUpdateSingleton.instance
    @refresh_qty = @refresh.refresh_quantity
    puts(@refresh_qty)
  end
  
  def price_change
    order = OrderSend.new()
    result = Pricing.new(order)
    puts(result)
    order.notify_observers
    puts("Pricing is completed. =========================================== Now count update and hit update is going to perform")
  end
  
end