class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # For CSS files...
  def styletag(sheet_name)
  "<link rel='stylesheet' href='/assets/stylesheets/#{:sheet_name}'>"
  end

  # For js files...
  def jstag(script_name)
  "<script src='/assets/javascripts/#{:script_name}'></script>"
  end
end
