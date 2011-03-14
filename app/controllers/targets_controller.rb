class TargetsController < ApplicationController
  def create
	
		## Check #credits
#		if current_hunter.credits_left > 0

	
			target1 = current_hunter.targets.build(:target_id => params[:id].to_s, :name => params[:name])

#			current_hunter.credits_left -= 1
			begin
				current_hunter.save
			rescue ActiveRecord::RecordNotUnique	
				puts "DEBUG-ERROR: Duplicated target!"
				render :text => ActiveSupport::JSON.encode({'statusText'=>'fail_duplicated_target'}) 
				return
			rescue Exception => e
				puts "DEBUG-ERROR: Exception - create target!"
				render :text => ActiveSupport::JSON.encode({'statusText'=>'fail_create_target'})
				return
			end		

			## There is a match
			if target2 = Target.find(:first, :conditions => ['target_id = ? and hunter_id = ?', current_hunter.id, params[:id].to_s])
		
				target1.matched_at = Time.now
				target2.matched_at = Time.now

				begin
					Target.transaction do
						target1.save!
						target2.save!
					end
				rescue Exception => e
					puts "DEBUG-ERROR: Exception - create match!"
					render :text => ActiveSupport::JSON.encode({'statusText'=>'fail_create_match'})
					return
				end	

				hunter2 = Hunter.find(target2.hunter_id)

=begin
				token1 = current_hunter.access_token || ""
				token2 = hunter2.access_token || ""



				subject = 'One of your friends wants to be your "friend with benefits"'
				fbml = 'Congratulations, a friend of yours wants to be more than just a friend!<br/><br/>Log in <a href="http://friends-with-benefits.me">here</a> to find out who it is.<br/><br/>The "Friends with Benefits" team' 

				uri1 = 'https://api.facebook.com/method/notifications.sendEmail?recipients='+current_hunter.hunter_id+'&subject='+subject+'&fbml='+fbml+'&access_token='+token1+'&format=json'
				uri2 = 'https://api.facebook.com/method/notifications.sendEmail?recipients='+hunter2.hunter_id+'&subject='+subject+'&fbml='+fbml+'&access_token='+token2+'&format=json'

				render :text => ActiveSupport::JSON.encode({'statusText'=>'matched', 'uri_1'=> uri1, 'uri_2'=> uri2}) 
=end
				render :text => ActiveSupport::JSON.encode({'statusText'=>'target_added'}) 				
				return

			## No match
			else
				render :text => ActiveSupport::JSON.encode({'statusText'=>'target_added'})
				return
			end

		## Credits <= 0
#		else
#			render :text => ActiveSupport::JSON.encode({'statusText'=>'no_credits'}) 
#			return
#		end

	end


	def get_targets	
		@class = 'target'
		@targets = current_hunter.targets.all(:order => 'name ASC')
#		@targets = current_hunter.targets.find(:all, :conditions => 'matched_at IS NULL') #rescue false
		render :partial => 'shared/targets'
	end


	def get_matches

		@class = 'match'
#		@targets = current_hunter.targets.find(:all, :conditions => 'matched_at IS NOT NULL') #rescue false
#		@targets = current_hunter.targets.find(:all, :conditions => 'matched_at IS NOT NULL', :order => 'matched_at ASC', :limit => current_hunter.reveals)
		@targets = current_hunter.targets.all(:conditions => 'matched_at IS NOT NULL', :order => 'matched_at ASC')
		render :partial => 'shared/targets'
	end


	def highlight
		@targets = current_hunter.targets
		render :partial => 'shared/highlight'
	end


	def destroy
=begin (EC Mar 12, 11)
		if current_hunter.targets.find_by_target_id(params[:id].to_s).destroy
			redirect_to root_url
			return
		else
			puts "DEBUG-ERROR: Failed to destroy target!"
			render :text => ActiveSupport::JSON.encode({'statusText'=>'fail_destroy'})
			return 
		end
=end
	end

end
