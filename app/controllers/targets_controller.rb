class TargetsController < ApplicationController
  def create
	#logger.debug current_hunter
	if current_hunter.credits > 0

		current_hunter.targets.create!(:target_id => params[:id])
		current_hunter.credits -= 1
		current_hunter.save
		redirect_to root_url
	
	else
		raise 'Failure' 
	end

end
  def get

#	@array = []
#	@targets = current_hunter.targets
#	 @targets.each do |target| 
#		@array << "<img src='http://graph.facebook.com/"+target.target_id.to_s+"/picture'>"
#	end 

#	render :text => @array

	@targets = current_hunter.targets
	
	render :partial => 'shared/preys'
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
