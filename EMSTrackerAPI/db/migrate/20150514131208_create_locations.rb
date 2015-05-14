class CreateLocations < ActiveRecord::Migration
  def up
  	create_table :locations do |t|
  		t.string   :user_name 
		t.string   :gps_latitude 
		t.string   :gps_longitude 
		t.string   :location
  	end
  end

  def down
  	drop_table :cases
  end
end