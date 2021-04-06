class AddTemperatureToWeatherCities < ActiveRecord::Migration[6.0]
  def change
    add_column :weather_cities, :temperature, :float
    add_column :weather_cities, :temperature_sens, :float
    add_column :weather_cities, :description, :string
    add_column :weather_cities, :sunrise, :string
    add_column :weather_cities, :sunset, :string
  end
end
