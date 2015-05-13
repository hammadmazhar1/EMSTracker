class CreateCases < ActiveRecord::Migration
  def up
  	create_table :cases do |t|
  		t.datetime :day_called
  		t.string   :time_called
  		t.datetime :day_resolved
  		t.string   :time_resolved
  		t.string   :patient
  		t.string   :mfr
  		t.string   :location
  		t.string   :details 
  	end
  end

  def down
  	drop_table :cases
  end
end
