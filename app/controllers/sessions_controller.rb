class SessionsController < ApplicationController

def create
	
#logger.debug params.inspect
#secret = decode_secret(params[:session][:secret])
access_token = params[:session][:access_token]

#logger.debug "DECODE PARAMS" + params.inspect
#redirect_to root_url
#return
#@secret = 'b6214e708bc46f37877b560f09b8cd1d'
#	if @secret == secret	

	
		if hunter = Hunter.find_by_hunter_id(params[:user][:id])
			hunter.update_attributes(:access_token => access_token)
	
			sign_in(hunter)
			redirect_to root_url
			
		else	
			hunter = Hunter.create(:hunter_id => params[:hunter_id], :email => params[:email], :first_name => params[:first_name], :last_name => params[:last_name], :gender => params[:gender], :DOB => params[:dob], :access_token => access_token)
			sign_in(hunter)
			redirect_to root_url
		
		end

#	end
		
end

def destroy

	session[:hunter_id] = nil
	redirect_to root_url

end

end
