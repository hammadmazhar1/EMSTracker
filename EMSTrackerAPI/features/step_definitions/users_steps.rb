Given /the following  exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
	db_movie = Movie.create!(movie)
  end
  #flunk "Unimplemented"
end

Then /the director of "(.*)" should be "(.*)"/ do |movie, director|
	movie_rec = Movie.find_by_title movie
        assert movie_rec.director == director
end