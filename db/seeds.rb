City.destroy_all
WeatherSource.destroy_all
WeatherCity.destroy_all

cities = CS.get(:ua).keys.map { |state| CS.get(:ua, state) }.flatten.grep(/^[A-z]{1,}$/)
sinoptik_ua = WeatherSource.create(name: 'Sinoptik.ua', url: '', css_selector: '.today-temp')

cities.first.each_with_index do |city_name, index|
  city = City.create(title: city_name)

  url = URI.parse("https://sinoptik.ua/redirector?search_city=#{city_name}")
  begin
    uri_open = URI.open(url)
  rescue => exception
    url_city = 'http:' + exception.io.meta['location'].force_encoding('utf-8')
    doc = Nokogiri::HTML(URI.open(URI.encode(url_city)))
    temperature = doc.css(sinoptik_ua.css_selector).first.content

    temperature_sens = doc.css('.temperatureSens > .p6.bR.cur').first.content
    infoDaylight = doc.css('.infoDaylight > span').map(&:content)

    # description = doc.css('.wDescription .description').first.content
    description = doc.xpath('//div[contains(@class,"wDescription")]//div[contains(@class,"description")]').first.content

    sinoptik_ua.weather_cities.create(city: city,
                                      path: url_city,
                                      temperature: temperature,
                                      temperature_sens: temperature_sens,
                                      description: description,
                                      sunrise: infoDaylight.first,
                                      sunset: infoDaylight.second)

    puts "[#{index.next}, #{cities.count}] Add weather for #{city.title}"
  ensure
    next
  end

  WeatherMailer.with(user: '_smile_@ua.fm').welcome_email.deliver_now
end


# city_dnepr = City.create(title: 'Dnipro')
# sinoptik_ua = WeatherSource.create(name: 'Sinoptik.ua', url: 'https://sinoptik.ua/', css_selector: '.today-temp')
# sinoptik_ua.weather_cities.create(city: city_dnepr, path: 'погода-днепр-303007131')
# gismeteo_ua = WeatherSource.create(name: 'Gismeteo.ua', url: 'https://www.gismeteo.ua/', css_selector: '.unit_temperature_c > .nowvalue__text_l')
# gismeteo_ua.weather_cities.create(city: city_dnepr, path: 'weather-dnipro-5077/now')
