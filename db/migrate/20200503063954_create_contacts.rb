class CreateContacts < ActiveRecord::Migration[6.0]
  def change
  	create_table :contacts do |t|
  		t.text :name 
  		t.text :text

  		t.timestamps
  	end	
  end
end
