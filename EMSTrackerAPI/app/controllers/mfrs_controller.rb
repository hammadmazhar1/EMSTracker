class MFRsController < ApplicationController

  def show
    id = params[:id] # retrieve user ID from URI route
    @mfr = MFR.find(id) # look up user by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    loggedin = params[:loggedin] || session[:loggedin]
    
    case loggedin
    when 'user'
      redirect_to users_path
    when 'mfr'
      @available_locs = Location.find_all();
    end
    
  end

  def new
    # default: render 'new' template
  end
  def log_in
    mfrToLogIn = MFR.find_by_username(params[:username])
    if mfrToLogIn.password == params[:password]
      session[:curlogid] = mfrToLogIn.id
      params[:curlogid] = mfrToLogIn.id
      params[:loggedin] = 'mfr'
      session[:loggedin] = 'mfr'
      redirect_to mfrs_path
    else
      flash[:warning] = "Incorrect Username and/or Password"
      redirect_to mfrs_path
    end
  end
  def create
    @mfr = MFR.create!(params[:mfr])
    flash[:notice] = "#{@mfr.username} was successfully added as a MFR."
    redirect_to mfrs_path
  end

  def edit
    curlogid = params[:curlogid]
    if curlogid == params[:id]
      @mfr = MFR.find params[:id]
    else
      flash[:warning] = "You do not have the priviledges to modify other MFRs details"
      redirect_to mfrs_path

  end

  def update
    @mfr = MFR.find params[:id]
    @mfr.update_attributes!(params[:mfr])
    flash[:notice] = "#{@mfr.username} was successfully updated."
    redirect_to user_path(@user)
  end

  def destroy
    @mfr = MFR.find(params[:id])
    @mfr.destroy
    flash[:notice] = "MFR '#{@mfr.username}' deleted."
    redirect_to mfrs_path
  end

end