require 'open-uri'

module WeatcherCity::Operation
  class UpdateTemperature < Trailblazer::Operation
    step Model(City, :find_by)
    pass :temperatures!
    step :save

    def temperatures!(_ctx, model:, **)
      model.weather_cities.each do |weather_city|
        url = URI.parse("#{weather_city.weather_source.url}?search_city=#{model.title}")
        begin
          uri_open = URI.open(url)
        rescue StandardError => e
          e.io.meta['location'].encode('utf-8')
        end
        doc_html = Nokogiri::HTML(uri_open)
        weather_city.temperature = doc_html.css(weather_city.weather_source.css_selector).first.content.to_f
      end
    end

    def save(_ctx, model:, **)
      model.save
    end
  end
end
