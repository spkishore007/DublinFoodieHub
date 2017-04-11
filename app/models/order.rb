require 'observer'
require 'product_update_single'
require 'pricing_observer'

class Order < ApplicationRecord
  include Observable
  before_validation :set_order_status
  belongs_to :order_status
  has_many :order_items

  before_save :total_cart_price
  after_save :add_notifier
  #include OrderObserver

  

  def totalcartprice
    order_items.collect { |orderitem| orderitem.valid? ? (orderitem.quantity * orderitem.unit_price) : 0 }.sum
  end
  
  def self.product_count_update
    @product_count = ProductUpdateSingleton.instance
    @count_up = @product_count.count_update
    puts(@count_up)
  end
  
  def self.product_refresh_qty
    @refresh = ProductUpdateSingleton.instance
    @refresh_qty = @refresh.refresh_quantity
    puts(@refresh_qty)
  end
  
  def self.price_change
    order = OrderSend.new()
    result = Pricing.new(order)
    puts(result)
    order.notify_observers
    puts("Pricing is completed. =========================================== Now count update and hit update is going to perform")
  end
  
private
  def set_order_status
   # self.order_status_id = 1
  end

  def total_cart_price
    self[:subtotal] = totalcartprice
  end

  def add_notifier
    add_observer(OrderObserver.new)
    changed
    notify_observers(self)
       puts("yyyyyyyyyy")
    product_count_update
    price_change
  end
end
