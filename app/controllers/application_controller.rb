class ApplicationController < ActionController::Base
  protect_from_forgery

  # sessions_helper contains session related helper methods
  include SessionsHelper

  # Force signout to prevent CSRF forgery
  def handle_unverified_request
    sign_out
    super
  end
end
