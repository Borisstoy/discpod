class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	# method to be able to save podcasts edits
  	# edit page
  	# works with signed_up users
  	# .permit method for rails5 instead of .for
  	devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation,
  	:current_password, :title, :description, :itunes, :stitcher, :podbay)} 
  	# permited parameters for users signing up
  	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation,
  	:title)} 
  end
end
