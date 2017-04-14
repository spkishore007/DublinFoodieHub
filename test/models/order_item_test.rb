require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  test "Order should not save without Order id" do
     order_item = OrderItem.new
     #order_item.order = Order.new
     order_item.product = Product.new
     assert_equal(false,order_item.save)
  end
  test "Order should not save without Order product id" do
     order_item = OrderItem.new
     order_item.order = Order.new
     #order_item.product = Product.new
     assert_equal(false,order_item.save)
  end
  test "Order should not save without validations" do
     order_item = OrderItem.new
     order_item.order = Order.new
     order_item.product = Product.new
     assert_equal(false,order_item.save)
  end
  test "Order should save" do
     order_item = OrderItem.new
     order_item.order = Order.new
     order_item.product = Product.new
     order_item.unit_price=12
     #order_item.quantity=1.0
     order_item.total_price = 12
     assert_equal(false,order_item.save)
  end
  test "Order should not save without order items quantity" do
     order_item = OrderItem.new
     order_item.order = Order.new
     order_item.product = Product.new
     order_item.unit_price = 12
     #order_item.quantity = 1
     order_item.total_price = 12
     assert_equal(false,order_item.save)
  end
    # test "the truth" do
  #   assert true
  # end
end
