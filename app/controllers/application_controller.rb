class ApplicationController < ActionController::Base

  #http_basic_authenticate_with name: Rails.application.secrets.username, password: Rails.application.secrets.password
  # Set custom basic authentication
  # Explanation here:
  # http://stackoverflow.com/questions/14790832/http-basic-auth-for-some-not-all-controllers
  # unprotected_controller.rb
  # skip_before_action :http_basic_authenticate
  before_action :http_basic_authenticate

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def http_basic_authenticate
    authenticate_or_request_with_http_basic do |name, password|
      name == Rails.application.secrets.username && password == Rails.application.secrets.password
    end
  end

end
