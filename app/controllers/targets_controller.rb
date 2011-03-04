class TargetsController < ApplicationController
  def create
	#logger.debug current_hunter
	if current_hunter.credits > 0

	
		target1 = current_hunter.targets.build(:target_id => params[:id], :name => params[:name])
		
		current_hunter.credits -= 1
		current_hunter.save		

		if target2 = Target.find(:first, :conditions => ['target_id = ? and hunter_id = ?', current_hunter.id, params[:id]])
		
			target1.matched_at = Time.now
			target2.matched_at = Time.now
	
			
			if MatchMailer.match_email('jscchiu@gmail.com').send_later(:deliver)
				target1.notified_at = Time.now		
			end
			
			if MatchMailer.match_email('jscchiu@gmail.com').send_later(:deliver)
				target2.notified_at = Time.now		
			end
	
			target1.save
			target2.save

			render :text => 'matched'
		
		else
		
			render :text => 'target_added'

		end


	

	else
		render :text => 'no_credits' 
		
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
	@targets = current_hunter.targets.find(:all, :conditions => 'matched_at IS NULL')
	
	render :partial => 'shared/targets'
  end

  def get_matched
	@title = 'Matched'
	@targets = current_hunter.targets.find(:all, :conditions => 'matched_at IS NOT NULL')
	render :partial => 'shared/targets'
  end

def highlight

	@targets = current_hunter.targets
	render :partial => 'shared/highlight'

end

  def destroy
	current_hunter.targets.find_by_target_id(params[:id]).destroy
	redirect_to root_url
	

  end

end
