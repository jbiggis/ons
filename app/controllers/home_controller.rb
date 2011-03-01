class HomeController < ApplicationController

	def show


	end

	def testes
		##logger.debug "debugger" + params[:data]["31"][:name]	
		debugstring = ""
		params[:data].each do |person|
			debugstring += person[1][:name]
		end
		logger.debug debugstring
	end

	def add
		logger.debug params.inspect
	end

end
