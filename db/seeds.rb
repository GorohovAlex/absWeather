City.destroy_all
WeatherSource.destroy_all
WeatherCity.destroy_all

city_dnepr = City.create(title: 'Dnipro')

sinoptik_ua = WeatherSource.create(name: 'Sinoptik.ua', url: 'https://sinoptik.ua/', css_selector: '.today-temp')
sinoptik_ua.weather_cities.create(city: city_dnepr, path: 'погода-днепр-303007131')

gismeteo_ua = WeatherSource.create(name: 'Gismeteo.ua', url: 'https://www.gismeteo.ua/', css_selector: '.unit_temperature_c > .nowvalue__text_l')
gismeteo_ua.weather_cities.create(city: city_dnepr, path: 'weather-dnipro-5077/now')