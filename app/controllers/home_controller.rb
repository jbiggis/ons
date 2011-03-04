class HomeController < ApplicationController

	def show

		if signed_in?
		
			

		end
	@credits = current_hunter.credits

	end

	def testes
		##logger.debug "debugger" + params[:data]["31"][:name]	
=begin		debugstring = ""
		params[:data].each do |person|
			debugstring += person[1][:name]
		end
		logger.debug debugstring
=end
		logger.debug params.inspect
		@targets = Target.find_by_hunter_id(params[:fb_id].to_i)
		logger.debug @targets.inspect
#		render :partial => 'target', :object => @targets
		render :text => @targets.target_id
		
	
	end

	def add
		logger.debug params.inspect
	end

end
