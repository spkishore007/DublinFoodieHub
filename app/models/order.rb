require 'observer'

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
  end
end
