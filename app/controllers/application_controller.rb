class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  helper_method :resource_name, :resource_name1, :resource, :resource1, :devise_mapping
  def resource_name
    :user
  end

  def resource_name1
    :job_alert
  end

  def resource1
    @resource1 ||= JobAlert.new
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
