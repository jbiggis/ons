
class FwbMailer < ActionMailer::Base

  default :from =>"jscchiu@gmail.com" 

  def match_email(email, name)

	@email = email
	@name = name

	mail(:to=> email, :subject => "Someone wants to be your Friend with Benefits!") 

  end

def invite_email(email, name)
	
	@email = email
	@name = name

	#mail(:to=> email, :subject => "Your friend has invited you to check out friends-with-benefits.me")
	mail(:to=> email, :subject => "Your friend is interested in being your Friend with Benefits") 

end

	#handle_asynchronously :invite_email

end
