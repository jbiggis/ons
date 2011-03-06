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


	
		if hunter = Hunter.find_by_hunter_id(params[:user][:id].to_s)
			hunter.update_attributes(:access_token => params[:session][:access_token])
	
			sign_in(hunter)
			redirect_to root_url
			
		else	
			hunter = Hunter.create(:hunter_id => params[:user][:id].to_s, :email => params[:user][:email], :first_name => params[:user][:first_name], :last_name => params[:user][:last_name], :gender => params[:user][:gender], :DOB => params[:user][:dob], :access_token => params[:session][:access_token])
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
