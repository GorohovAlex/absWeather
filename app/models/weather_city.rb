# == Schema Information
#
# Table name: weather_cities
#
#  id                :bigint           not null, primary key
#  description       :string
#  path              :string
#  sunrise           :string
#  sunset            :string
#  temperature       :float
#  temperature_sens  :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  city_id           :bigint
#  weather_source_id :bigint
#
# Indexes
#
#  index_weather_cities_on_city_id            (city_id)
#  index_weather_cities_on_weather_source_id  (weather_source_id)
#
class WeatherCity < ApplicationRecord
  belongs_to :weather_source
  belongs_to :city
end
