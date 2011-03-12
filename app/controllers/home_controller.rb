class HomeController < ApplicationController

	def show

		if signed_in?
				
		@reveals = current_hunter.reveals if current_hunter != nil

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

private

	def signed_in?
		cookies[:fbs_202763786417566]
	end

end
