class ApplicationController < ActionController::Base
  protect_from_forgery

  # filter sensitive data from logging
  filter_parameter_logging "password"

  # sessions_helper contains session related helper methods
  include SessionsHelper

  # Force signout to prevent CSRF forgery
  def handle_unverified_request
    sign_out
    super
  end
end
