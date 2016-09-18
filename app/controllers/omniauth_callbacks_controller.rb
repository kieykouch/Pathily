class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	require 'open-uri'
	include HTTParty

    def linkedin
    	print "*****\n"
    	print request.env["omniauth.auth"]
    	print "\n********"
	 	user = User.from_omniauth(request.env["omniauth.auth"])
	 	if user.persisted?
	 		flash.notice = "Signed In"
	 		sign_in_and_redirect user
	 	else
	 		session["devise.user_attributes"]
	 		redirect_to new_user_registration_path
	 	end
	 end

	 def facebook
    	user = User.from_omniauth_facebook(request.env["omniauth.auth"])
	 	if user.persisted?
	 		flash.notice = "Signed In"
	 		sign_in_and_redirect user
	 	else
	 		session["devise.user_attributes"]
	 		redirect_to new_user_registration_path
	 	end
	 end

	 def google_oauth2
	 	

	 	#token = request.env["omniauth.auth"]["credentials"]["token"]
	 	#response = HTTParty.get("https://www.google.com/m8/feeds/contacts/default/thin?access_token="+token+"&alt=json")
	 	#contacts = JSON.parse(response.body)
	 	#contacts = contacts["feed"]["entry"]
	 	#contacts1 = contacts.select{|p| p["gd$email"]}
	 	#contacts1 = contacts1.collect{|p| {name: p["title"]["$t"], email: p["gd$email"][0]["address"]} }
	 	
    	user = User.from_omniauth_gmail(request.env["omniauth.auth"])
	 	if user.persisted?
	 		flash.notice = "Signed In"
	 		sign_in_and_redirect user
	 	else
	 		session["devise.user_attributes"]
	 		redirect_to new_user_registration_path
	 	end
	 end
end
