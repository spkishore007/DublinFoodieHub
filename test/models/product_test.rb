require 'test_helper'

class ProductTest < ActiveSupport::TestCase
test "should not save store product without name" do
  product = Product.new
  product.store_detail=StoreDetail.new
  assert_equal(false,product.save)
end

test "should not able to store without store id" do
  product = Product.new
  product.name = "qwerty"
  product.quantityAvailable="1"
  assert_equal(false,product.save)
end

test "should able to get always active product" do
  products = Product.all
  assert_equal(false,products== Product.where(active: true))
end

test "should Special Chracter not allowed" do
  product = Product.new
  product.name = "$%5^&{$}"
  assert_equal(false,product.save)
end

test "should integer allowed only" do
  product = Product.new
  product.price = "xbschjsdab"
  assert_equal(false, product.save)
end


test "should offer integer allowed only" do
  product = Product.new
  product.offerPrice = "xbschjsdab"
  assert_equal(false,product.save)
end

test "should limit 500 character" do
  product = Product.new
  product.description = "hank you for visiting www.voxpop.com, an Online store exclusively for Bioworld Retail products in India. The brand “VOXPOP” belongs to Bioworld Retail Private Limited. Your visit to this website is subject to these Terms and Conditions and our Privacy Policy available here on this website.
Once you place an order with Bioworld Retail Private Limited, you cannot cancel this order once it is processed. You can only return damaged products or products that are not as per your order. Returns must comply with the return conditions as given in this agreement.
Bioworld Retail Private Limited has the right to assign or transfer all or part of its rights or obligations under this Agreement without prior notification.
This Agreement shall be subject to and construed in accordance with the laws of India and subject to the arbitration agreement as set out hereinafter, the Parties hereby submit to the exclusive jurisdiction of the courts of Uttar Pradesh.
n the event of any disputes, differences or controversies between the Parties hereto, out of or in connection with the provisions of this Agreement, or any action taken hereunder, the Par"
  assert_equal(false, product.save)
end





  # test "the truth" do
  #   assert true
  # end
end
