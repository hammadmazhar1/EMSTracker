class MFR < ActiveRecord::Base
	has_many :emergencies
	attr_accessible :username,:password,:rollno,:name,:phoneno,:gender,:gps
	
end
