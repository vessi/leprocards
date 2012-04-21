require 'simplecov'

SimpleCov.start do
  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
  add_group "Helpers", "app/helpers"
  add_filter "/spec/"
  add_filter "/config/"
end
