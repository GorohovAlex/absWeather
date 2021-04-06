class CityDecorator < ApplicationDecorator
  delegate_all

  def temperature
    temperatures.join
  end

  def temperature_sens
    temperatures_sens.join
  end

  def description
    descriptions.join
  end

  def sunrise
    sunrises.join
  end

  def sunset
    sunsets.join
  end

  private

  def temperatures
    @temperatures = object.weather_cities.map(&:temperature).compact
  end

  def temperatures_sens
    @temperatures = object.weather_cities.map(&:temperature_sens).compact
  end

  def descriptions
    @descriptions = object.weather_cities.map(&:description).compact
  end

  def sunrises
    @sunrises = object.weather_cities.map(&:sunrise).compact
  end

  def sunsets
    @sunsets = object.weather_cities.map(&:sunset).compact
  end
end
