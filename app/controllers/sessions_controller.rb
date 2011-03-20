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
			puts "DEBUG-ERROR: Unauthorized access (session controller)"
			raise "ERROR!"
			return
		end	
		#####

		## If existing user
		if hunter = Hunter.find_by_hunter_id(sess[:uid].to_s)

			login_count = hunter.login_count + 1
			hunter.update_attributes(:login_count => login_count, :last_login => Time.now)

		## First time user
		else	
			user_params = params[:user]

			Hunter.create(:hunter_id => user_params[:id].to_s, :email => user_params[:email], :first_name => user_params[:first_name], :last_name => user_params[:last_name], :gender => user_params[:gender], :login_count => 1, :last_login => Time.now)
		end

		render :text => :nothing
		#		redirect_to root_url

=begin
		## Check whether a facebook session already exists
		if params[:status] == "connected"
			user = Hash.new
			user_id = sess[:uid]
			login_count = 0
		
		else
			user = params[:user]
			user_id = params[:user][:id]
			login_count = 1
		end

		## If existing user
		if hunter = Hunter.find_by_hunter_id(user_id.to_s)
			if login_count == 1
				login_count += hunter.login_count
				hunter.update_attributes(:access_token => sess[:access_token], :login_count => login_count, :last_login => Time.now)
			else
				hunter.update_attributes(:access_token => sess[:access_token])
			end
	
		## First time user
		else	
			hunter = Hunter.create(:hunter_id => user_id.to_s, :email => user[:email], :first_name => user[:first_name], :last_name => user[:last_name], :gender => user[:gender], :DOB => user[:birthday], :access_token => sess[:access_token], :login_count => 1, :last_login => Time.now)
		end

		render :text => :nothing
=end

	end

	def destroy
		#session[:hunter_id] = nil
		#redirect_to root_url
	end

end
