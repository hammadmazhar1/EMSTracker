Given /the following MFRs exist/ do |mfrs_table|
  mfrs_table.hashes.each do |mfr|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
	db_mfr = MFR.create!(mfr)
  end
  #flunk "Unimplemented"
end

Given /the following Users exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
	db_user = User.create!(user)
  end
  #flunk "Unimplemented"
end

Given /the following Locations exist/ do |locations_table|
  locations_table.hashes.each do |location|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
	db_location = Location.create!(location)
  end
  #flunk "Unimplemented"
end
Given /the following Kits exist/ do |kits_table|
  kits_table.hashes.each do |kit|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
	db_kit = Kit.create!(kit)
  end
  #flunk "Unimplemented"
end
#Given /I am on the (.*) page/ do |page|
#	case page
#end
When /my GPS coordinates are "(.*)" and "(.*)"/ do |lat, long|
	
end
Then /the director of "(.*)" should be "(.*)"/ do |movie, director|
	movie_rec = Movie.find_by_title movie
        assert movie_rec.director == director
end