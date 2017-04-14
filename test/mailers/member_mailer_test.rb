require 'test_helper'

class MemberMailerTest < ActionMailer::TestCase
 test "invite" do
    # Create the email and store it for further assertions
   
    email = MemberMailer.welcome_member_email(members).deliver_now
 
    assert_not ActionMailer::Base.deliveries.empty?
 
    assert_equal ["test68599@gmail.com"],              email.from

    assert_equal "Confirm your Culttt Membership!", email.subject
    
 end
end
