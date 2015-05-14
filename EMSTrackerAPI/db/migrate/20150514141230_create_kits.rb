class CreateKits < ActiveRecord::Migration
  def up
  	create_table :kits do |t|
		t.string :location
		t.string :details 
		t.boolean :available 								
  	end
  end

  def down
  	drop_table :cases
  end
end
