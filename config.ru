# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run ElephundRails::Application

# if Rails.env.production?
#   DelayedJobWeb.use Rack::Auth::Basic do |username, password|
#     username == 'admin' && password == 'elephund99'
#   end
# end