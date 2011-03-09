require 'md5'

class SessionsController < ApplicationController

	def create

		##### Verify valid facebook session
		if (sess = params[:session]) == nil
			#raise "ERROR: Invalid Session!"
			return
		end

		args = sess.sort	

		payload = ""
		args.each do |i|
			if i[0] != "sig"
				payload += i[0] + "=" + i[1]
			end
		end
		
		if MD5.new(payload + SECRET) != sess[:sig]
			raise "ERROR: Cannot verify user!"
			return
		end	
		#####

		## Check whether a facebook session already exists
		if params[:status] == "connected"
			user = Hash.new
			user_id = sess[:uid]
		
		else
			user = params[:user]
			user_id = params[:user][:id]
		end
		## If existing user
		if hunter = Hunter.find_by_hunter_id(user_id.to_s)
			hunter.update_attributes(:access_token => sess[:access_token])
	
			#sign_in(hunter)
			redirect_to root_url

		## First time user
		else	
			hunter = Hunter.create(:hunter_id => user_id.to_s, :email => user[:email], :first_name => user[:first_name], :last_name => user[:last_name], :gender => user[:gender], :DOB => user[:dob], :access_token => sess[:access_token])
			#sign_in(hunter)
			redirect_to root_url
		end

	end

	def destroy
		#session[:hunter_id] = nil
		#redirect_to root_url
	end

end
