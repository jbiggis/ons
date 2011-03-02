class TargetsController < ApplicationController
  def create
	#logger.debug current_hunter
	Hunter.find(session[:hunter_id]).targets.create!(:target_id => params[:id])
	redirect_to root_url
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

  def destroy
  end

end
