
module SessionsHelper
	def current_user
	# use what's stored in our session
  # to find which user we are
		@current_user ||= User.find(session[:user_id])
	end

  def logged_in?
    session[:user_id] != nil
  end

end

