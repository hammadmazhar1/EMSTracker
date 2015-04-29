class UsersController < ApplicationController

  def show
    id = params[:id] # retrieve user ID from URI route
    @user = User.find(id) # look up user by unique ID
    # will render app/views/users/show.<extension> by default
  end

  
  

  def new
    # default: render 'new' template
    @user = User.new
  end

  def create
    @user = User.create!(params[:user])
    flash[:notice] = "#{@user.username} was successfully added as a user."
    redirect_to users_path
  end

  def edit
    
  end

end