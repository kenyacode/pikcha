class UsersController < ApplicationController
	def index
		@users = User.all 
	end

	def show
		@user = User.find(params [:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new
		if @user.save
			redirect_to list_path
		else
			render :new
		end

	def edit

	end

	def destroy
		@user = User.destroy
	end

	private
		def user_params
			params.require(:user).permit(:image, :email, :first_name, :last_name, :password)
		end
	end
end
