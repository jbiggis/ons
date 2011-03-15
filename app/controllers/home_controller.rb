class HomeController < ApplicationController

	def show

		if signed_in?
			if current_hunter != nil
				#@reveals = current_hunter.reveals 
				@invites = current_hunter.invites
				#@waits = current_hunter.targets.all(:conditions => 'matched_at IS NOT NULL').count	
			end
		end
	end

	def about

	end

	def faq
	
	end

	def tos

	end

	def pp

	end


end
