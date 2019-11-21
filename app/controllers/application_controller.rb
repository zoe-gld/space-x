class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user!, :set_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def set_user
    @user = current_user
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number])
   end
end
