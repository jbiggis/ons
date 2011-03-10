class TargetsController < ApplicationController
  def create
	
		## Check #credits
		if current_hunter.credits_left > 0

	
			target1 = current_hunter.targets.build(:target_id => params[:id].to_s, :name => params[:name])

			current_hunter.credits_left -= 1
			begin
				current_hunter.save
			rescue ActiveRecord::RecordNotUnique	
				render :text => ActiveSupport::JSON.encode({'statusText'=>'fail_duplicated_target'}) 
				return
			rescue Exception => e
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
					render :text => ActiveSupport::JSON.encode({'statusText'=>'fail_create_match'})
					return
				end	

				hunter2 = Hunter.find(target2.hunter_id)

				token1 = current_hunter.access_token || ""
				token2 = hunter2.access_token || ""


				subject = 'One of your friends wants to be your "friend with benefits"'
				text = 'Congratulations, a friend of yours wants to be more than just friends!\nLog in<a href="http://friends-with-benefits.me">here</a> to find out who it is.\n\nThe "friends-with-benefits" team' 

				uri1 = 'https://api.facebook.com/method/notifications.sendEmail?recipients='+current_hunter.hunter_id+'&subject='+subject+'&text='+text+'&access_token='+token1+'&format=json'
				uri2 = 'https://api.facebook.com/method/notifications.sendEmail?recipients='+hunter2.hunter_id+'&subject='+subject+'&text='+text+'&access_token='+token2+'&format=json'

				render :text => ActiveSupport::JSON.encode({'statusText'=>'matched', 'uri_1'=> uri1, 'uri_2'=> uri2}) 
				return

			## No match
			else
				render :text => ActiveSupport::JSON.encode({'statusText'=>'target_added'})
				return
			end

		## Credits <= 0
		else
			render :text => ActiveSupport::JSON.encode({'statusText'=>'no_credits'}) 
			return
		end

	end


  def get_targets	
		@class = 'target'
		@targets = current_hunter.targets.find(:all, :conditions => 'matched_at IS NULL') #rescue false
		render :partial => 'shared/targets'
  end


  def get_matches

		@class = 'match'
		@targets = current_hunter.targets.find(:all, :conditions => 'matched_at IS NOT NULL') #rescue false
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
