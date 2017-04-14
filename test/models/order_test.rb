require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "Order should not save without Order status id" do
     order = Order.new
     #comment.Product = Product.new
     assert_equal(false,order.save)
  end
  test "Order should save" do
     order = Order.new
     order.order_status = OrderStatus.new
     order.subtotal = 50
     order.tax = 10
     order.shipping = 2
     order.total = 62
     assert_equal(true,order.save)
  end
  test "Order should not save without subtotal" do
     order = Order.new
     order.order_status = OrderStatus.new
     #order.subtotal = 50
     order.tax = 10
     order.shipping = 2
     order.total = 62
     assert_equal(false,order.save)
  end
  test "Order should not save without tax" do
     order = Order.new
     order.order_status = OrderStatus.new
     order.subtotal = 50
     #order.tax = 10
     order.shipping = 2
     order.total = 62
     assert_equal(false,order.save)
  end
  test "Order should not save without shipping" do
     order = Order.new
     order.order_status = OrderStatus.new
     order.subtotal = 50
     order.tax = 10
     #order.shipping = 2
     order.total = 62
     assert_equal(false,order.save)
  end
  test "Order should not save without total" do
     order = Order.new
     order.order_status = OrderStatus.new
     order.subtotal = 50
     order.tax = 10
     order.shipping = 2
     #order.total = 62
     assert_equal(false,order.save)
  end
  # test "the truth" do
  #   assert true
  # end
end
