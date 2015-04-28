class UsersController < ApplicationController

  def show
    id = params[:id] # retrieve user ID from URI route
    @user = User.find(id) # look up user by unique ID
    # will render app/views/users/show.<extension> by default
  end

  def log_in
    userToLogIn = User.find_by_username(params[:username])
    if userToLogIn.password == params[:password]
      session[:curlogid] = userToLogIn.id
      params[:curlogid] = userToLogIn.id
      params[:loggedin] = 'user'
      session[:loggedin] = 'user'
      redirect_to users_path
    else
      flash[:warning] = "Incorrect Username and/or Password"
      redirect_to users_path
    end
  end
  def create_emergency
    emergency = Emergency.new()
    emergency.
  end
  def index
    loggedin = params[:loggedin] || session[:loggedin]
    
    case loggedin
    when 'user'
      
    when 'mfr'
      redirect_to mfrs_path
    end
    
  end

  def new
    # default: render 'new' template
  end

  def create
    @user = User.create!(params[:user])
    flash[:notice] = "#{@user.username} was successfully added as a user."
    redirect_to users_path
  end

  def edit
    curlogid = params[:curlogid] || session[:curlogid]
    if curlogid == params[:id]
      @user = User.find params[:id]
    else
      flash[:warning] = "You are not authorised to change other users data."
      redirect_to users_path
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes!(params[:user])
    flash[:notice] = "#{@user.username} was successfully updated."
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User '#{@user.username}' deleted."
    redirect_to users_path
  end

end