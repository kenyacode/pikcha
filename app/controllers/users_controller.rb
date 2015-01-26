class UsersController < ApplicationController
	def index
		@users = User.all 
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id.to_s
			redirect_to users_path
		else
			flash[:fail] = "Sign in unsucessfull!"
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])

		foo = 'bar' # Won't be passed to View
		@another = 1; # @var will be passed into view
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to users_path
		else
			render "edit"
		end
	end


	private

		def user_params
			params.require(:user).permit(:image, :email, :first_name, :last_name, :password)
		end
end