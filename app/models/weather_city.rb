class WeatherCity < ApplicationRecord
    belongs_to :weather_source
    belongs_to :city
end
