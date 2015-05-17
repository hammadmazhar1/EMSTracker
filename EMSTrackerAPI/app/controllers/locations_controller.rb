class LocationsController < ApplicationController
	def create
		cur_loc = params[:location]
		cur_long = cur_loc[:gps_longitude].to_f
		cur_lat = cur_loc[:gps_latitude].to_f
		if cur_long >=74.4103 && cur_long <= 74.4112
			if cur_lat <=31.4724 && cur_lat >= 31.4713
				cur_loc[:location] = "SSE"
			
			elsif cur_lat <= 31.4713 && cur_lat >=31.4700
				cur_loc[:location] = "Male Hostel"
			end
		elsif cur_long >=74.41000 && cur_long <= 74.4110
			cur_loc[:location] = "PDC"
		elsif cur_long >=74.4090 && cur_long <= 74.4100
			if cur_lat <=31.4713 && cur_lat >=31.4700
				cur_loc[:location] = "Academic Block"
			elsif cur_lat <=31.4700 && cur_lat >= 31.4670
				cur_loc[:location] = "Sports Complex"
			end
		elsif cur_long <=74.4089 && cur_long >= 74.4083
			if cur_lat >= 31.4708 && cur_lat <= 31.4698
				cur_loc[:location] = "Library"
			elsif cur_lat >= 31.4698 && cur_lat <=31.4680
				cur_loc[:location] = "SDSB"
			end
		elsif cur_long <=74.40788 && cur_long >=74.4065
			cur_loc[:location] = "Female Hostel"
		else
			@location = Location.find_by_user_name(cur_loc[:user_name])
			if (!@location.nil?)
				@location.delete
			end
			redirect_to new_location
		end
		@location =  Location.find_by_user_name(cur_loc[:user_name])
		if (@location.nil?)
			@location.update_attributes(cur_loc)
		else
			Location.create(cur_loc)
		end
	end

	def destroy
		username = params[:location][:user_name]
		location = Location.find_by_user_name(username);
		if (!location.nil?) {
			location.delete
		}
	end
end
