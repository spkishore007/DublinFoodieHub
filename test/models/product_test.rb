require 'test_helper'

class ProductTest < ActiveSupport::TestCase
test "should not save store product without name" do
  product = Product.new
  product.store_detail =StoreDetail.new
  product.price = 12
  product.offerPrice = 5
  product.allergens = "beef"
  product.foodType = "veg"
  product.foodSize = 9
  product.calorie = 250
  product.quantityAvailable = 100
  product.active = true
  #product.store_detail_id = 1
  #product.name="xccvb"
  product.description="hello"
  assert_equal(false,product.save)
end

test "should not able to store without store id" do
  product = Product.new
  #product.store_detail =StoreDetail.new
  product.price = "wats wrong"
  product.offerPrice = "halo"
  product.allergens = "beef"
  product.foodType = "veg"
  product.foodSize = 9
  product.calorie = 250
  product.quantityAvailable = 100
  product.active = true
  #product.store_detail_id = 1
  product.name="xccvb"
  product.description="hello"
  assert_equal(false,product.save)
end

test "should able to get always active product" do
  product = Product.new
  product.store_detail =StoreDetail.new
  product.price = 12
  product.offerPrice = 5
  product.allergens = "beef"
  product.foodType = "veg"
  product.foodSize = 9
  product.calorie = 250
  product.quantityAvailable = 100
  #product.active = true
  #product.store_detail_id = 1
  product.name="xccvb"
  product.description="hello"
  assert_equal(true,products== Product.where(active: true))
end

test "should Special Chracter not allowed" do
  product = Product.new
  product.store_detail =StoreDetail.new
  product.price = 12
  product.offerPrice = 5
  product.allergens = "beef"
  product.foodType = "veg"
  product.foodSize = 9
  product.calorie = 250
  product.quantityAvailable = 100
  product.active = true
  #product.store_detail_id = 1
  product.name="#@$%&*("
  product.description="hello"
  assert_equal(true,product.save)
end

test "should integer allowed only" do
  product = Product.new
  product.store_detail =StoreDetail.new
  product.price = "yes this is a integer"
  product.offerPrice = 5
  product.allergens = "beef"
  product.foodType = "veg"
  product.foodSize = 9
  product.calorie = "should be a integer"
  product.quantityAvailable = 100
  product.active = true
  #product.store_detail_id = 1
  product.name="xccvb"
  product.description="hello"
  assert_equal(true, product.save)
end


test "should offer integer allowed only" do
  product = Product.new
  product.store_detail =StoreDetail.new
  product.price = 12
  product.offerPrice = 5
  product.allergens = "beef"
  product.foodType = "veg"
  product.foodSize = 9
  product.calorie = 250
  product.quantityAvailable = 100
  product.active = true
  #product.store_detail_id = 1
  product.name="xccvb"
  product.description="hello"
  assert_equal(true,product.save)
end

test "should limit 500 character" do
  product = Product.new
  product.store_detail =StoreDetail.new
  product.price = 12
  product.offerPrice = 5
  product.allergens = "beef"
  product.foodType = "veg"
  product.foodSize = 9
  product.calorie = 250
  product.quantityAvailable = 100
  product.active = true
  #product.store_detail_id = 1
  product.name="xccvb"
  product.description = "hank you for visiting www.voxpop.com, an Online store exclusively for Bioworld Retail products in India. The brand “VOXPOP” belongs to Bioworld Retail Private Limited. Your visit to this website is subject to these Terms and Conditions and our Privacy Policy available here on this website.
Once you place an order with Bioworld Retail Private Limited, you cannot cancel this order once it is processed. You can only return damaged products or products that are not as per your order. Returns must comply with the return conditions as given in this agreement.
Bioworld Retail Private Limited has the right to assign or transfer all or part of its rights or obligations under this Agreement without prior notification.
This Agreement shall be subject to and construed in accordance with the laws of India and subject to the arbitration agreement as set out hereinafter, the Parties hereby submit to the exclusive jurisdiction of the courts of Uttar Pradesh.
n the event of any disputes, differences or controversies between the Parties hereto, out of or in connection with the provisions of this Agreement, or any action taken hereunder, the Par"
  assert_equal(true, product.save)
end

test "check index" do
  products = Product.all
  assert_equal(products, products)
end



  # test "the truth" do
  #   assert true
  # end
end
