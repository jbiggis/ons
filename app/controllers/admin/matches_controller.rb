class Admin::MatchesController < ApplicationController
	before_filter :admin_logged_in?

	def show
		@targets = Target.all(:conditions => 'matched_at IS NOT NULL and notified_at IS NULL or notified_at =""')
	end

	def update
		targets = Target.all(:conditions => 'matched_at IS NOT NULL and notified_at IS NULL or notified_at =""')
		targets.each do |target|
			hunter = target.hunter
			if hunter.email != nil
				logger.debug "!!!!!!EMAIL"+ hunter.hunter_id + " "+hunter.email
		    if FwbMailer.match_email(hunter.email, hunter.first_name).deliver
logger.debug target.inspect
		
		

target.notified_at = Time.now
	target.save
					#target.update_attributes(:notified_at => Time.now)
		    else
					puts "DEBUG-ERROR: Deliver Match Notification Email: " + target.hunter_id + ", " + target.target_id
		    end
			end
		end
		redirect_to show_admin_matches_path
	end

private

def admin_logged_in?
	if !admin_signed_in?
		redirect_to root_url
	end
end



end
