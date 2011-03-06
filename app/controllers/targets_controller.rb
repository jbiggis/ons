require "net/http"
require 'uri'

class TargetsController < ApplicationController
  def create
	

		#logger.debug current_hunter
		if current_hunter.credits_left > 0

	
			target1 = current_hunter.targets.build(:target_id => params[:id].to_s, :name => params[:name])

			current_hunter.credits_left -= 1
			current_hunter.save		

			if target2 = Target.find(:first, :conditions => ['target_id = ? and hunter_id = ?', current_hunter.id, params[:id].to_s])
		
				target1.matched_at = Time.now
				target2.matched_at = Time.now
	
				#if Net::HTTP.get(URI.parse('https://api.facebook.com/method/notifications.sendEmail'))
				#if MatchMailer.delay.match_email('jscchiu@gmail.com')
			
				#	target1.notified_at = Time.now		
				#end
			
				#if MatchMailer.delay.match_email('jscchiu@gmail.com')
				#	target2.notified_at = Time.now		
			
				#end
	#			end
		
				target1.save
				target2.save
	
				hunter2 = Hunter.find(target2.hunter_id)

				token1 = current_hunter.access_token
				token2 = hunter2.access_token


				subject = 'There\'s a One Night Stand waiting for you'
				text = 'You have a match. Log in to see who it is.' 

				uri1 = 'https://api.facebook.com/method/notifications.sendEmail?recipients='+current_hunter.hunter_id+'&subject='+subject+'&text='+text+'&access_token='+token1+'&format=json'
				uri2 = 'https://api.facebook.com/method/notifications.sendEmail?recipients='+hunter2.hunter_id+'&subject='+subject+'&text='+text+'&access_token='+token2+'&format=json'

				render :text => ActiveSupport::JSON.encode({'statusText'=>'matched', 'uri_1'=> uri1, 'uri_2'=> uri2}) 
			
		
			else
				render :text => ActiveSupport::JSON.encode({'statusText'=>'target_added'})
				return
			end

		else
			render :text => ActiveSupport::JSON.encode({'statusText'=>'no_credits'}) 
			return
		end

	end



  def get_targets

#	@array = []
#	@targets = current_hunter.targets
#	 @targets.each do |target| 
#		@array << "<img src='http://graph.facebook.com/"+target.target_id.to_s+"/picture'>"
#	end 

#	render :text => @array

		@title = 'Targets'
		@class = 'target'
		@targets = current_hunter.targets.find(:all, :conditions => 'matched_at IS NULL')
	
		render :partial => 'shared/targets'
  end

  def get_matches
		@title = 'Matches'
		@class = 'match'
		@targets = current_hunter.targets.find(:all, :conditions => 'matched_at IS NOT NULL')
		render :partial => 'shared/targets'
  end

	def highlight

		@targets = current_hunter.targets
		render :partial => 'shared/highlight'

	end

  def destroy
		if current_hunter.targets.find_by_target_id(params[:id].to_s).destroy
			redirect_to root_url
			return
		else
			render :text => ActiveSupport::JSON.encode({'statusText'=>'fail_destroy'})
			return 
		end
  end

end
