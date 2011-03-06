class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :signed_in?, :current_hunter

def sign_in(hunter)

	session[:hunter_id]= hunter.hunter_id

end

def current_hunter

	@current_hunter ||= Hunter.find_by_hunter_id(session[:hunter_id]) if session[:hunter_id]

end

def signed_in?

	session[:hunter_id]

end
end
