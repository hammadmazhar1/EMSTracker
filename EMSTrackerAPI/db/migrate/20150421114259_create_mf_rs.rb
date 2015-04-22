class CreateMfRs < ActiveRecord::Migration
  def up
  	create_table :mfrs do |t|
  		t.string :username
  		t.string :password
  		t.string :rollno
  		t.string :name
  		t.string :gender
  		t.string :phoneno
  	end
  end

  def down
  	drop_table :mfrs
  end
end
