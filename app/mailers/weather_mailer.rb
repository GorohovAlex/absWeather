class WeatherMailer < ApplicationMailer
  default from: 'weather@smile.s-host.net'

  def welcome_email
    @url = 'http://example.com/login'
    mail(to: '_smile_@ua.fm', subject: 'Welcome to My Awesome Site')
  end
end
