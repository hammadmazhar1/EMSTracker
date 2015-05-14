
Given /the following Users exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
	db_user = User.create!(user)
  end
  #flunk "Unimplemented"
end


#Given /I am on the (.*) page/ do |page|
#	case page
#end
When /my GPS coordinates are "(.*)", "(.*)"/ do |lat, long|
	find(:xpath, "//input[@id='gps_latitude']").set lat
	find(:xpath, "//input[@id='gps_longitude']").set long
end

And /I login as User "(.*)"/ do|val|
	fill_in('Username', :with => val)
	fill_in('Password', :with => val)
	 click_button('Log In')
end

	
	
