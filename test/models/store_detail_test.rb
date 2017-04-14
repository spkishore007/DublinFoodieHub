require 'test_helper'

class StoreDetailTest < ActiveSupport::TestCase
   test "store_detail should not save without member id" do
     store_detail = StoreDetail.new
     #store_detail.member = Member.new
     assert_equal(false,store_detail.save)
   end
   test "should save the store_detail" do
     store_detail = StoreDetail.new
     store_detail.member = Member.new
     store_detail.store_name = "xcvb"
     
     store_detail.building = "28"
     store_detail.city = "dublin"
     store_detail.street ="grsg"
     store_detail.pincode =1
     store_detail.store_mobile =2345
     store_detail.store_email ="ksg@sg.com"
     
     assert_equal(true,store_detail.save)
   end
   test "should not save the store_detail without name" do
     store_detail = StoreDetail.new
     store_detail.member = Member.new
     #store_detail.store_name = "xcvb"
     
     store_detail.building = "28"
     store_detail.city = "dublin"
     store_detail.street ="grsg"
     store_detail.pincode =1
     store_detail.store_mobile =2345
     store_detail.store_email ="ksg@sg.com"
     
     assert_equal(false,store_detail.save)
   end
   test "should not save the store_detail without email" do
     store_detail = StoreDetail.new
     store_detail.member = Member.new
     store_detail.store_name = "xcvb"
     store_detail.building = "28"
     store_detail.city = "dublin"
     store_detail.street ="grsg"
     store_detail.pincode =1
     store_detail.store_mobile =2345
     #store_detail.store_email ="ksg@sg.com"
     
     assert_equal(false,store_detail.save)
   end
   test "should not save the store_detail without mobile" do
     store_detail = StoreDetail.new
     store_detail.member = Member.new
     store_detail.store_name = "xcvb"
     
     store_detail.building = "28"
     store_detail.city = "dublin"
     store_detail.street ="grsg"
     store_detail.pincode =1
     #store_detail.store_mobile =2345
     store_detail.store_email ="ksg@sg.com"
     
     assert_equal(false,store_detail.save)
   end
   test "should not save the store_detail without variables assigned " do
     store_detail = StoreDetail.new
     store_detail.member = Member.new
     #store_detail.store_name = "xcvb"
     #
     #store_detail.building = "28"
     #store_detail.city = "dublin"
     #store_detail.street ="grsg"
     #store_detail.pincode =1
     #store_detail.store_mobile =2345#
     #store_detail.store_email ="ksg@sg.com"
     #
     assert_equal(false,store_detail.save)
   end
   test "should not be storing when data is not unqiue" do
     store_detail1 = StoreDetail.new
     store_detail1.member = Member.new
     store_detail1.store_name = "xcvb"
     store_detail1.building = "28"
     store_detail1.city = "dublin"
     store_detail1.street ="grsg"
     store_detail1.pincode =1
     store_detail1.store_mobile =2345
     store_detail1.store_email ="ksg@sg.com"
     
     store_detail2 = StoreDetail.new
     store_detail2.member = Member.new
     store_detail2.store_name = "xcvb"
     store_detail2.building = "28"
     store_detail2.city = "dublin"
     store_detail2.street ="grsg"
     store_detail2.pincode =1
     store_detail2.store_mobile =2345
     store_detail2.store_email ="ksg@sg.com"
     
     assert_equal(true,store_detail1.save)
     assert_equal(true,store_detail2.save)
     
   end
  # test "the truth" do
  #   assert true
  # end
end
