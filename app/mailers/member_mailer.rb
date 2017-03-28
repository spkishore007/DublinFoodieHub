class MemberMailer < ApplicationMailer
    	default from: "test68599@gmail.com"

   def welcome_member_email(member)
    @member = member
    @url  = "http://example.com/login"
    mail(:to => member.email, :subject => "Welcome to My Awesome Site")
   end
  
    def welcome_store_email(member)
    @member = member
    @url  = "http://example.com/login"
    mail(:to => member.email, :subject => "Your store is added.")
    end
  
    def order_email(order)
  	@member = order.member
    mail(to: @member.email, subject: 'Sample Email')
    end
  
end
