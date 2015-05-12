class SessionsController < ApplicationController
  def new
  	if logged_in?
  		redirect_to current_user
  	end
  end
  def create
  	user = User.find_by_username(params[:session][:username])
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		redirect_to user
  	else
  		flash[:danger] = 'Invalid username/password combination'
  		render 'new'
  	end
  	
  end
  def destroy
  	logout
  	flash[:notice] = "Successfully logged out"
  	redirect_to users_path
  end
end
