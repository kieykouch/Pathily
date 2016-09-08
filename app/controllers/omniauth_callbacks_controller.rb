class OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def linkedin
	 	user = User.from_omniauth(request.env["omniauth.auth"])
	 	if user.persisted?
	 		flash.notice = "Signed In"
	 		sign_in_and_redirect user
	 	else
	 		session["devise.user_attributes"]
	 		redirect_to new_user_registration_path
	 	end
	 end
end
