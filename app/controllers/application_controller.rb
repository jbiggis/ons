class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :signed_in?, :current_hunter

	## deprecated (only uses facebook's cookie)
	#def sign_in(hunter)
	#	session[:hunter_id]= hunter.hunter_id
	#end


	def signed_in?
		cookies[:fbs_202763786417566]
	end

	def current_hunter

		if @current_hunter == nil
			if cookies[:fbs_202763786417566]
				cookie=Hash[cookies[:fbs_202763786417566].gsub('"','').split("&").map{|s| s.split("=")}]
				@current_hunter = Hunter.find_by_hunter_id(cookie["uid"].to_s)
			end
		end
		@current_hunter
		#@current_hunter ||= Hunter.find_by_hunter_id(session[:hunter_id]) if session[:hunter_id]
	end


	def admin_signed_in?

		if cookies[:fbs_202763786417566]
			cookie=Hash[cookies[:fbs_202763786417566].gsub('"','').split("&").map{|s| s.split("=")}]
			if cookie["uid"].to_s == ADMIN_1 || cookie["uid"].to_s == ADMIN_2
				return true
			else
				return false
			end
		end

	end

end
