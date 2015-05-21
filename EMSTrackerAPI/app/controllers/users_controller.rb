class UsersController < ApplicationController

  def show
    id = params[:id] # retrieve user ID from URI route
    session[:user_id] = id
    @user = User.find(id) # look up user by unique ID
    # will render app/views/users/show.<extension> by default
  end
 
  def update
    session[:user_id] = params[:id]
    @user =User.find params[:id]
    if params[:user][:password] != params[:user][:password_confirmation]
      flash[:warning] = "Passwords do not match"
      redirect_to edit_user_path(@user)
    end
    @user.update_attributes!(params[:user])
    flash[:notice] = "User details was successfully updated."
    redirect_to user_path(@user)
  end
  
  def new
    # default: render 'new' template
    @user = User.new
  end

  def create
    prev_user = User.find_by_username(params[:user][:username])
    if prev_user.nil?
      @user = User.create!(params[:user])
      flash[:notice] = "#{@user.username} was successfully added as a user."
      redirect_to users_path
    else
      flash[:error] = "Username has already been taken"
      redirect_to new_user_path
    end
  end

  def edit

    @user =User.find params[:id]
  end

  def get_help
    session[:user_id] = params[:id]
    ary= Array.new	
      loc=Location.all
      lat=params[:gps_latitude]
      lat=lat.to_f
      long=params[:gps_latitude]
      long=long.to_f
      loc.each do |d|
  	    elm= Array.new
        pos=Math.sqrt((d.gps_latitude.to_f-lat)**2+(d.gps_latitude.to_f-long)**2)
        elm.push(pos)
        elm.push(d.user_name)
        elm.push(d.location)
        ary.push(elm)
      end
      list= Array.new    
      ary.sort { |x, y| x.at(0) <=> y.at(0) }
      ary.each do|mfr|
     	  us =User.find_by_id(mfr.at(1))
        if (us.mfr) 
          elm= Array.new
          elm.push(us)
          elm.push(mfr.at(2))
  	     list.push(elm)
        end
      end
    @q=list
  
  end 
end
