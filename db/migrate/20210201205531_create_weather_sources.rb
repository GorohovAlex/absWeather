class CreateWeatherSources < ActiveRecord::Migration[6.0]
  def change
    create_table :weather_sources do |t|
      t.string :name
      t.string :url
      t.string :css_selector
      t.timestamps
    end
  end
end
