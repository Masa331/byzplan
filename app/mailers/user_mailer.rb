class UserMailer < ActionMailer::Base
	default from: "donat@copyhat.cz" 
  
	def url_mail(user)
		mail(to: "pdonat@seznam.cz", subject: "URL vaseho planu")
	end
end
