require 'test_helper'

class MemberTest < ActiveSupport::TestCase
   test "Member should not save without validation" do
     member = Member.new
     assert_equal(false,member.save)
   end
   test "should not save without the email" do
     member = Member.new
     #member.email = "what@what.com"
     member.user_name = "dghsdg"
     assert_equal(false,member.save)
   end
   
   test "should not save when email is not unique" do
     member = Member.new
     member.email = "what@what.com"
     member.password = "Qwerty@123"
     member1 = Member.new
     member1.email = "what@what.com"
     member1.password = "Qwerty@123"
     assert_equal(true,member.save)
     assert_equal(false,member1.save)
   end
   
   
   test "should not save without the password" do
     member = Member.new
     member.email = "what@what.com"
     #member.password = "dghsdg"
     assert_equal(false,member.save)
   end
   
   
   test "should not save the member when password is less than 9 characters" do
     member = Member.new
     member.email = "what@what.com"
     member.password = "Qwer!23"
     assert_equal(false,member.save)
   end
  
   test "should not save the member when password doesnt have 1 uppercase " do
     member = Member.new
     member.email = "what@what.com"
     member.password = "qwerty@123"
     assert_equal(false,member.save)
   end
   
   test "should not save the member when password doesnt have 1 small case " do
     member = Member.new
     member.email = "what@what.com"
     member.password = "QWERTY@123"
     assert_equal(false,member.save)
   end
   test "should not save the member when password doesnt have 1 digit" do
     member = Member.new
     member.email = "what@what.com"
     member.password = "Qwertyuio"
     assert_equal(false,member.save)
   end
   test "should save the member when password have 1 uppercase, small case and a digit" do
     member = Member.new
     member.email = "what@what.com"
     member.password = "Qwerty@123"
     assert_equal(true,member.save)
   end
  
  # test "the truth" do
  #   assert true
  # end
end
