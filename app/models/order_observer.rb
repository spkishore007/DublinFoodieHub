class OrderObserver
  def update(record)
      
    if record.order_status.name == "Confirmed"
      puts("qwerrty")
       MemberMailer.order_email(@order).deliver
     	record.order_items.each do |order_item|
         order_item.product.update_attribute(:quantityAvailable,order_item.product.quantityAvailable.to_i - order_item.quantity) 
        end
    end
  end
end