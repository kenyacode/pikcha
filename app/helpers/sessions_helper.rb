module SessionsHelper
	module SessionsHelper
		def current_user
		# use what's stored in our session
    # to find which user we are
			@current_user ||= User.find(session[:user_id])
		end
	end
end
