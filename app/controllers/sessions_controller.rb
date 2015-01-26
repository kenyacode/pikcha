class SessionsController < ApplicationController
	def new
	end
	def create
		user = User.where(email: params[:login][:email]).first
		if user && user.authenticate(params[:login][:password])
			session[:user_id] = user.id.to_s
			session[:user_name] = user.first_name + " " + user.last_name
			redirect_to user
		else
			flash[:fail] = "Your log in failed"
			redirect_to login_path
		end
	end
	def destroy
		session.delete(:user_id)
		redirect_to login_path
	end
end
