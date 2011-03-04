module ApplicationHelper

def signed_in(hunter)

	session[:hunter_id]= hunter.hunter_id

end

def current_hunter

	@current_hunter ||= Hunter.find(session[:hunter_id]) if session[:hunter_id]

end

def signed_in?

	session[:hunter_id]

end

end
