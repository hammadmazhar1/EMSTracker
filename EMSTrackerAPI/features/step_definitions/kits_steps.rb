Given /the following Kits exist/ do |kits_table|
  kits_table.hashes.each do |kit|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
	db_kit = Kit.create!(kit)
  end
  #flunk "Unimplemented"
end
