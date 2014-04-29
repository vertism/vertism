source 'http://rubygems.org'

gem 'rails', '3.2.17'

group :production do
  gem 'pg'
end
group :development, :test do
  gem 'sqlite3'
end

gem 'rest_client'
gem 'lastfm'
gem 'twitter', '~> 5.0'

gem 'better_errors'
gem 'binding_of_caller'
gem 'thin'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2'
  gem 'coffee-rails', '~> 3.2'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '~> 2.0.0'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
end
