class Location < ActiveRecord::Base
	attr_accessible   :user_name ,:gps_latitude, :gps_longitude ,:location
end
