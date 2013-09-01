require 'current_user'
require_dependency 'camp_core'

class ApplicationController < ActionController::Base

  include CurrentUser

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def index; end

  private

  def ensure_logged_in
    raise Camp::NotLoggedIn unless current_user.present?
  end

end
