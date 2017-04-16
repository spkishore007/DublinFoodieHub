require 'pizza_app_logger'

class MemberObserver < ActiveRecord::Observer
  def after_create(member)
     logger = MyLogger.instance
     logger.logInformation(member.email)    
      MemberMailer.welcome_member_email(member).deliver!
  end
end