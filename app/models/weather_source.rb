# == Schema Information
#
# Table name: weather_sources
#
#  id           :bigint           not null, primary key
#  css_selector :string
#  name         :string
#  url          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class WeatherSource < ApplicationRecord
  has_many :weather_cities
end
