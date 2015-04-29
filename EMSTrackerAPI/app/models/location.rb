class Location < ActiveRecord::Base
	belongs_to :mfr
	attr_accessor :gps_latitude, :gps_longitude, :location
end
