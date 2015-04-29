class User < ActiveRecord::Base
	has_many :emergencies
	attr_accessible :username, :password, :rollno, :phoneno, :gender, :gps_lat ,:gps_long
end
