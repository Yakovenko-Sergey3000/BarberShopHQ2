class CreateClients < ActiveRecord::Migration[6.0]
  def change
	create_table :client do |t|
	t.text :name
	t.text :phone
	t.text :datestamp
	t.text :barer
	t.text :color

	t.timestamps
	end 
  end
end
