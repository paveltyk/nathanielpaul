source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'slim'
gem 'simple-navigation'
gem 'jquery-rails', '~> 2.0.0'
gem 'thin'
gem 'sendgrid-rails', '~> 2.0.2'
gem 'simple_form'
gem 'strong_parameters'
gem 'rmagick'
gem 'carrierwave'
gem 'fog'
gem 'breadcrumbs_on_rails'
gem 'prawn'
gem 'prawnto'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'turbo-sprockets-rails3', :git => 'git://github.com/ndbroadbent/turbo-sprockets-rails3.git'
  # Synchronises Assets between Rails and S3.
  # gem 'asset_sync'
  gem 'bootstrap-sass', '~> 2.3.2.0'
  gem 'asset_sync'
end

group :production, :staging do
  gem 'pg'
end

group :test do
  gem 'capybara',  git: 'https://github.com/jnicklas/capybara', :ref => 'd153635e6546ecc742e2b805390bc42a1e863d7c'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'rspec-html-matchers'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'debugger'
  gem 'better_errors'
  gem 'mysql2'
end
