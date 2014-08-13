class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception

    protected

  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation, :remember_me) }
     devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:firstname, :username, :email, :password, :remember_me) }
     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password) }
  end
end

