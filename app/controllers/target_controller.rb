class TargetController < ApplicationController
  def create
	
	current_hunter.create(:target_id => params[:id])
	

  end

  def destroy
  end

end
