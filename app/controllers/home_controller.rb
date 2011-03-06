class HomeController < ApplicationController

	def show
#logger.debug "cookie"+cookies[:fbs_195039077183959]#['access_token']

		if signed_in?
		
			
		@credits = current_hunter.credits_left

		end
	end
=begin	
	def testes
		##logger.debug "debugger" + params[:data]["31"][:name]	
	debugstring = ""
		params[:data].each do |person|
			debugstring += person[1][:name]
		end
		logger.debug debugstring

		logger.debug params.inspect
		@targets = Target.find_by_hunter_id(params[:fb_id].to_i)
		logger.debug @targets.inspect
#		render :partial => 'target', :object => @targets
		render :text => @targets.target_id
		
	
	end

	def add
		logger.debug params.inspect
	end
=end
end
