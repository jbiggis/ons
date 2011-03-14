class InviteController < ApplicationController
  def create
	#flash[:notice]=params[:email]
	#FwbMailer.invite_email(params[:email])

#	FwbMailer.invite_email('jscchiu@gmail.com', 'yo').deliver
#	current_hunter.invites -= 1
#	current_hunter.save
	render :text => "success"

  end

  
end
