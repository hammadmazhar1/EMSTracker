# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

mfrs = [{:username => 'usaidm', :password => 'usaidm', :name => 'Usaid Mandvia', :rollno => '16110325', :phoneno =>'03331310724'},
    	  {:username => 'asada', :password => 'asada', :name => 'Shah Asad Alam', :rollno => '16100172', :phoneno =>'03423253269'},
        {:username => 'rashida', :password => 'rashida', :name => 'Rashid Anwar', :rollno => '16120033', :phoneno => '03135469821'}
  	 ]
locations = [{:mfr_id => 1, :gps_latitude => '31.470855', :gps_longitude =>'74.412103', :location=>'M-6'},
            {:mfr_id => 2, :gps_latitude => '31.380445', :gps_longitude =>'74.412103', :location=>'SSE'}  
          ]
mfrs.each do |mfr|
  MFR.create!(mfr)
end

locations.each do |location|
  Location.create!(location)
end
