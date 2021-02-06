Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'weather_sources#index'
end
