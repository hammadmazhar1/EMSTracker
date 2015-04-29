class CreateLocations < ActiveRecord::Migration
  def up
  	create_table :locations do |t|
  		t.belongs_to :mfr
  		t.string :gps_latitude
  		t.string :gps_longitude
  		t.string :location
  		t.timestamps null: false
  	end
  end

  def down
  	drop_table :locations
  end
end
