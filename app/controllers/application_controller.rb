class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include CanCan::ControllerAdditions

  # ensure that authorisation happens on every action
  # check_authorization

  # handle unauthorised access
  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to root_url, :alert => exception.message
  # end

  # config.action_view.field_error_proc = Proc.new { |html_tag, instance|
  #   "<div class=\"field_with_errors control-group error\">#{html_tag}</div>".html_safe
  # }

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end



end
