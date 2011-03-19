class InviteController < ApplicationController
  def create
		#flash[:notice]=params[:email]

		FwbMailer.invite_email(params[:email],params[:name]).deliver
		current_hunter.invites_sent += 1
		current_hunter.save
		render :text => "success"
  end

  
end
