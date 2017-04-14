require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
   test "Profile should not save without member id" do
     profile = Profile.new
     #profile.member = Member.new
     assert_equal(false,profile.save)
   end
   test "should save the profile" do
     profile = Profile.new
     profile.member = Member.new
     profile.firstName = "xcvb"
     profile.idProof = "halo"
     profile.building = "28"
     profile.city = "dublin"
     profile.street ="grsg"
     profile.pincode =1
     profile.mobile =2345
     profile.dateOfBirth = 23/11/2012
     profile.email ="ksg@sg.com"
     profile.lastName ="dghdfh"
     assert_equal(true,profile.save)
   end
   test "should not save the profile without name" do
     profile = Profile.new
     profile.member = Member.new
     #profile.firstName = "xcvb"
     profile.idProof = "halo"
     profile.building = "28"
     profile.city = "dublin"
     profile.street ="grsg"
     profile.pincode =1
     profile.mobile =2345
     profile.dateOfBirth = 23/11/2012
     profile.email ="ksg@sg.com"
     profile.lastName ="dghdfh"
     assert_equal(false,profile.save)
   end
   test "should not save the profile without idproof" do
     profile = Profile.new
     profile.member = Member.new
     profile.firstName = "xcvb"
     #profile.idProof = "halo"
     profile.building = "28"
     profile.city = "dublin"
     profile.street ="grsg"
     profile.pincode =1
     profile.mobile =2345
     profile.dateOfBirth = 23/11/2012
     profile.email ="ksg@sg.com"
     profile.lastName ="dghdfh"
     assert_equal(false,profile.save)
   end
   test "should not save the profile without mobile interested" do
     profile = Profile.new
     profile.member = Member.new
     profile.firstName = "xcvb"
     profile.idProof = "halo"
     profile.building = "28"
     profile.city = "dublin"
     profile.street ="grsg"
     profile.pincode =1
     #profile.mobile =2345
     profile.dateOfBirth = 23/11/2012
     profile.email ="ksg@sg.com"
     profile.lastName ="dghdfh"
     assert_equal(false,profile.save)
   end
   test "should not save the profile without variables assigned " do
     profile = Profile.new
     profile.member = Member.new
     #profile.firstName = "xcvb"
     #profile.idProof = "halo"
     #profile.building = "28"
     #profile.city = "dublin"
     #profile.street ="grsg"
     #profile.pincode =1
     #profile.mobile =2345
     #profile.dateOfBirth = 23/11/2012
     #profile.email ="ksg@sg.com"
     #profile.lastName ="dghdfh"
     assert_equal(false,profile.save)
   end
   test "should not be storing when idproof and mobile is not unqiue" do
     profile1 = Profile.new
     profile1.member = Member.new
     profile1.firstName = "xcvb"
     profile1.idProof = "halo"
     profile1.building = "28"
     profile1.city = "dublin"
     profile1.street ="grsg"
     profile1.pincode =1
     profile1.mobile = 2345
     profile1.dateOfBirth = 23/11/2012
     profile1.email ="ksg@sg.com"
     profile1.lastName ="dghdfh"
     
     profile2 = Profile.new
     profile2.member = Member.new
     profile2.firstName = "xcvb"
     profile2.idProof = "halo"
     profile2.building = "28"
     profile2.city = "dublin"
     profile2.street ="grsg"
     profile2.pincode =1
     profile2.mobile = 2345
     profile2.dateOfBirth = 23/11/2012
     profile2.email ="ksg@sg.com"
     profile2.lastName ="dghdfh"
     
     assert_equal(true,profile1.save)
     assert_equal(true,profile2.save)
     
   end
end
