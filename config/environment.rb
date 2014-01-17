# Load the rails application
require File.expand_path('../application', __FILE__)

# def ping_apps
#   App.all.each do |app|
#     url = app.url
#     response = HTTParty.get(url)
#   end
#     sleep(10.seconds)
#     ping_apps
# end

# Initialize the rails application
MetaPinger::Application.initialize!
