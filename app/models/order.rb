class Order < ApplicationRecord
  before_validation :set_order_status
  belongs_to :order_status
  has_many :order_items

  before_save :total_cart_price
  

  def totalcartprice
    order_items.collect { |orderitem| orderitem.valid? ? (orderitem.quantity * orderitem.unit_price) : 0 }.sum
  end
private
  def set_order_status
    self.order_status_id = 1
  end

  def total_cart_price
    self[:subtotal] = totalcartprice
  end
end
