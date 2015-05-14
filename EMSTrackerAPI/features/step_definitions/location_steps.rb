Given /the following Locations exist/ do |locations_table|
  locations_table.hashes.each do |location|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
	db_location = Location.create!(location)
  end
  #flunk "Unimplemented"
end

