
class MatchMailer < ActionMailer::Base
	      default :from =>"jscchiu@gmail.com" 
def match_email(email)

	@email = email

	mail(:to=> email, :subject => "You have a match at ONS notifier!")
end


end
