class CreateWeatherCities < ActiveRecord::Migration[6.0]
  def change
    create_table :weather_cities do |t|
      t.references :weather_source
      t.references :city
      t.string :path
      t.timestamps
    end
  end
end
