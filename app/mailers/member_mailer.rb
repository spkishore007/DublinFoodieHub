class MemberMailer < ApplicationMailer
    	default from: "test68599@gmail.com"

   def welcome_member_email(member)
 
    @member = member
    @url  = "http://example.com/login"
    mail(to: "subitb.mec@gmail.com", subject: 'Welcome to Dublin Pizza Shop!!!')
   end
  
    def welcome_store_email(store)
    @store = store
    @url  = "http://example.com/login"
    mail(to: "subitb.mec@gmail.com", subject: 'Your store added to Dublin Pizza Shop!!!')
    end
  
    def order_email(order)
     @order=order
    mail(to: "subitb.mec@gmail.com", subject: 'Sample Email')
    end
  
end
