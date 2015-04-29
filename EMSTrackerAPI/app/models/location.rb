class Location < ActiveRecord::Base
	belongs_to :mfr
	attr_accessible :gps_latitude, :gps_longitude, :location,:mfr_id
end
