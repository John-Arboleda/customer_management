class RemoveCityIdFromCities < ActiveRecord::Migration[6.1]
  def change
    remove_column :cities, :city_id, :integer
  end
end
