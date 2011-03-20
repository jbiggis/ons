
class FwbMailer < ActionMailer::Base

  default :from => "Facebook FWB-Game" 

  def match_email(email, name)

	@email = email
	@name = name

	mail(:to=> email, :subject => "Someone wants to be your Friend with Benefits!") 

  end

	def invite_email(email, name)
	
		@email = email
		@name = name

		mail(:to=> email, :subject => "Hey "+@name+", one of your Facebook friends has invited you to play the Friends with Benefits game") 

	end

	#handle_asynchronously :invite_email

end
