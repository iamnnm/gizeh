class ApplicationController < ActionController::Base
  add_flash_types :success, :error, :notice, :alert

  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  helper_method :current_user_can_edit?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:user) do |user_params|
      user_params.permit(:email, :password, :remember_me)
    end
  end

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def current_user_can_edit?(event)
    user_signed_in? && current_user == event.user
  end
end
