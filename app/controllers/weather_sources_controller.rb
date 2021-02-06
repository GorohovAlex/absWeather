class WeatherSourcesController < ApplicationController
  def index
    weather_cities = WeatherCity.all

    @model = weather_cities.map do |weather_city|
      doc = Nokogiri::HTML(URI.open(URI.encode("#{weather_city.weather_source.url}#{weather_city.path}")))

      doc.css(weather_city.weather_source.css_selector).first.content
    end
  end
end
