class HomeController < ApplicationController

	def show

		if signed_in?
				
		@credits = current_hunter.credits_left

		end
	end

private

	def signed_in?
		cookies[:fbs_195039077183959]
	end

end
