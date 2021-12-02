class ApplicationController < ActionController::Base
  
  #executed before access to userpage
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # the metgid under the private is called only in this controller
  private 
  # resistration of username
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

end
