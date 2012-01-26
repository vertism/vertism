#Load heroku vars
heroku_env = Rails.root.join('config', 'heroku_env.rb')
load(heroku_env) if File.exists?(heroku_env)

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Vertism::Application.initialize!
