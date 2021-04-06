ActiveAdmin.register WeatherCity do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :weather_source_id, :city_id, :path
  #
  # or
  #
  # permit_params do
  #   permitted = [:weather_source_id, :city_id, :path]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
