source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'pg'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'turbo-sprockets-rails3', :git => 'git@github.com:ndbroadbent/turbo-sprockets-rails3.git'
  # Synchronises Assets between Rails and S3.
  # gem 'asset_sync'
end

gem 'jquery-rails'

group :test do
  gem 'rspec-rails', git: 'git://github.com/rspec/rspec-rails.git'
  gem 'capybara',  git: 'https://github.com/jnicklas/capybara', :ref => 'd153635e6546ecc742e2b805390bc42a1e863d7c'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'rspec-html-matchers'
end

group :development do
	gem 'thin'
end

group :test, :development do
	gem 'debugger'
end
