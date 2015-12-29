class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def flash_notice(message)
    flash[:notice] ||= ''
    flash[:notice] += message
  end

  def flash_alert(message)
    flash[:alert] ||= ''
    flash[:alert] += message
  end
end
