class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  decent_configuration { strategy DecentExposure::StrongParametersStrategy }

  rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Access denied."
  redirect_to root_url
end
end
