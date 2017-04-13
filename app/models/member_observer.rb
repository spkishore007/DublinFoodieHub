class MemberObserver < ActiveRecord::Observer
  def after_create(member)
      MemberMailer.welcome_member_email(member).deliver!
  end
end