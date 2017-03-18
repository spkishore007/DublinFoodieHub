class ApplicationController < ActionController::Base
  alias_method :current_user, :current_member
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  #giving no authorisation to devise parameters
  #after_action :verify_authorized, unless: :devise_controller? 
  
  #to show better messages
  rescue_from Pundit::NotAuthorizedError, with: :member_not_authorized
  

  
    private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |member|
        member.permit(:email, :password, :password_confirmation, :first_name, :last_name)
      end

      devise_parameter_sanitizer.permit(:account_update) do |member|
        member.permit(:email, :password, :password_confirmation, :first_name, :last_name)
      end
    end
    
    def member_not_authorized
     respond_to do |format|
     format.html { redirect_to (root_path), notice: 'You have no privileges to view' }
     end
    end
end
