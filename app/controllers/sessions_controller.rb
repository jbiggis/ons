require 'md5'

class SessionsController < ApplicationController

def create

	if params[:session] == nil
		raise "ERROR: Invalid Session!"
		return
	end

	args = params[:session].sort	

	payload = ""
	args.each do |i|
		if i[0] != "sig"
			payload += i[0] + "=" + i[1]
		end
	end
		
	if MD5.new(payload + SECRET) != params[:session][:sig]
		raise "ERROR: Cannot verify user!"
		return
	end	

#	access_token = params[:session][:access_token]

#logger.debug "DECODE PARAMS" + params.inspect
#redirect_to root_url
#return


	
		if hunter = Hunter.find_by_hunter_id(params[:user][:id])
			hunter.update_attributes(:access_token => params[:session][:access_token])
	
			sign_in(hunter)
			redirect_to root_url
			
		else	
			hunter = Hunter.create(:hunter_id => params[:hunter_id], :email => params[:email], :first_name => params[:first_name], :last_name => params[:last_name], :gender => params[:gender], :DOB => params[:dob], :access_token => params[:session][:access_token])
			sign_in(hunter)
			redirect_to root_url
		
		end

#	end
		
end

def destroy

	session[:hunter_id] = nil
	redirect_to root_url

end

private

APP_ID = '195039077183959'
SECRET = 'b6214e708bc46f37877b560f09b8cd1d'

end

end
