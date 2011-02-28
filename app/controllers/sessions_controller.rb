class SessionsController < ApplicationController

def create
	
	if hunter = Hunter.find_by_hunter_id(params[:hunter_id])

		sign_in(hunter)
		redirect_to root_url
			
	else	
		hunter = Hunter.create(:hunter_id => params[:hunter_id], :email => params[:email], :first_name => params[:first_name], :last_name => params[:last_name], :gender => params[:gender], :DOB => params[:dob])
		sign_in(hunter)
		redirect_to root_url
		
	end
		
end

def destroy

	session[:hunter_id] = nil
	redirect_to root_url

end

end
