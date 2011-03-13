class InviteController < ApplicationController
  def create
	#flash[:notice]=params[:email]
	#FwbMailer.invite_email(params[:email])

	FwbMailer.invite_email('jscchiu@gmail.com', 'yo').deliver
	render :nothing => true
  end

  
end
