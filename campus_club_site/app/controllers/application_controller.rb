class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include  SessionsHelper
  def render_404
  	raise ActionController::RoutingError.new('Not Found')
  end 
  def notLoggedIn
  	redirect_to login_url
  end 
end
