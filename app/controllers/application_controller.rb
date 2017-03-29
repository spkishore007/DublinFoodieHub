class ApplicationController < ActionController::Base
  alias_method :current_user, :current_member
  include Pundit
  
  # Prevent CSRF attacks by raising an exception.
  #For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  #giving no authorisation to devise parameters
  #after_action :verify_authorized, unless: :devise_controller? 
  
  #to show better messages
  rescue_from Pundit::NotAuthorizedError, with: :member_not_authorized


  helper_method :current_order

  before_action :strict_transport_security
 
  def after_sign_in_path_for(resource)
  "/signedinuserprofile"
  end
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

    def current_order
      if !session[:order_id].nil?
       Order.find(session[:order_id])
       else
       Order.new
      end
    end
    
  def strict_transport_security
    if request.ssl?
      response.headers['Strict-Transport-Security'] = "max-age=31536000; includeSubDomains"
    end
  end
  

end
