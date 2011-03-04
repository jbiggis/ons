
class MatchMailer < ActionMailer::Base
	      default :from =>"jscchiu@gmail.com" 
def match_email(email)

	@email = email

	mail(:to=> email, :subject => "You have a match at ONS notifier!")


##https://api.facebook.com/method/notifications.sendEmail?recipients=565445939&subject=idiot&text=test&access_token=195039077183959|2.7U3OwOr2p6_0_eLIVe98OQ__.3600.1299182400-28118863|GkXQf2kcsB_qRO8swkkXnWhYjLM&format=json
end


end
