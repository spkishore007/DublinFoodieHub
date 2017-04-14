require 'test_helper'

class OrderStatusTest < ActiveSupport::TestCase
  test "Order should not save without order status name" do
     order_status = OrderStatus.new
     assert_equal(false,order_status.save)
  end
  test "Order should save" do
     order_status = OrderStatus.new
     order_status.name = "sfddsg"
     assert_equal(true,order_status.save)
  end
  
  # test "the truth" do
  #   assert true
  # end
end
