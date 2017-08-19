class SessionsController < ApplicationController

	def new
		if session[:user_id]
			@user = User.find_by(id: session[:user_id])
			redirect_to user_path(@user)
		end
	end

	def create
		@user = User.find_by(username: params[:user][:username])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			flash[:message] = "Your username and/or password were incorrect. Please try again."
			redirect_to sign_in_path
		end
	end

	def destroy
		session.clear
		redirect_to sign_in_path
	end

end
