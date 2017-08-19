class UsersController < ApplicationController

	#User shouldn't be able to see all users...redirects to their homepage or to sign in if they aren't logged in
	def index
		if session.include? :user_id
			redirect_to user_path(User.find_by(id: session[:user_id]))
		else
			redirect_to sign_in_path
		end
	end	

	def new
		@user = User.new
	end

	def show
		@user = User.find_by(id: params[:id])
	end

	def create
		@user = User.new(user_params)
		if params[:user][:password] != params[:user][:password_confirmation]
			flash[:message] = "Your passwords do not match. Please try again"
			render :new
		else
			@user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		end
	end

	def edit
		@user = User.find_by(id: params[:id])
	end

	def update
		@user = User.find_by(id: params[:id])
		@user.update(user_params)
		redirect_to user_path(@user)
	end

	def destroy
		@user = User.find_by(id: params[:id])
		@user.destroy
		redirect_to root_path
	end


	private

	def user_params
		params.require(:user).permit(:username, :first_name, :last_name, :happiness, :health, :password, :password_confirmation, :admin)
	end
end
