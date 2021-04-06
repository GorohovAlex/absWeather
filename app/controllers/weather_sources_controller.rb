class WeatherSourcesController < ApplicationController
  def index
    @cities = City.includes(:weather_cities).all.decorate
  end
end
