class CreateUsers < ActiveRecord::Migration
  def up
  	create_table :users do |t|
  		t.string :username
  		t.string :password_digest
  		t.boolean :mfr
  		t.string :name
  		t.string :rollno
  		t.string :phoneno
  		t.string :gender
  	end
  end

  def down
  	drop_table :users
  end
end
