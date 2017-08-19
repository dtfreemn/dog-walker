class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_login
  	redirect_to sign_in_path unless session.include? :user_id
  end

  #NOT WORKING
  def require_admin
  	 if !@user
  	 	redirect_to sign_in_path
  	 elsif @user.admin != true
  	 	redirect_to user_path(@user)
  	 end
  end
end
