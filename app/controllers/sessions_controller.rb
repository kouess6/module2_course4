class SessionsController < ApplicationController
  def new
  end

  def create
  	username = params[:user][:username]
  	password = params[:user][:password]
  	user = User.find_by(username: username)
  	if user && user.authenticate(password)
  	  session[:user_id] = user.id
  	  redirect_to root_path , notice: "Logged in successfully" 
  	else
  	  redirect_to login_path, alert: "Invalid username/password combination"
    end
  end

  def destroy
  	reset_session #wiping out the user's session and everything in it
  	redirect_to login_path, notice: "You have been logged out"
end
end
