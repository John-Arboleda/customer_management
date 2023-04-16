class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.integer :client_id
      t.string :name
      t.integer :city_id

      t.timestamps
    end
  end
end
