class InviteController < ApplicationController
  def create
	#flash[:notice]=params[:email]
	#FwbMailer.invite_email(params[:email])

	FwbMailer.invite_email('jscchiu@gmail.com', 'yo').deliver
	redirect_to root_url
  end

  
end
