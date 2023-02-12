source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4', '>= 7.0.4.2'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.4.5'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 6.0.2'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder', '~> 2.11.5'

gem 'dotenv-rails', '~> 2.8.1'
gem 'pagy', '~> 6.0.1'
gem 'slim-rails', '~> 3.5.1'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.16.0', require: false
# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem 'faker', '~>3.1.1'
  gem 'pry', '~>0.14.2'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'bullet', '~>7.0.3'
  gem 'bundler-audit', '~> 0.9.1', require: false
  gem 'bundler-leak', '~> 0.3.0', require: false
  gem 'fasterer', '~> 0.10.0', require: false
  gem 'rubocop', '~>1.44.1', require: false
  gem 'rubocop-i18n', '~> 3.0', require: false
  gem 'rubocop-md', '~> 1.1', require: false
  gem 'rubocop-performance', '~>1.15.2', require: false
  gem 'rubocop-rails', '~> 2.17.4', require: false
  gem 'rubocop-rake', '~> 0.6.0', require: false
  gem 'web-console', '~>4.2.0'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  gem 'rspec-rails', '6.0.1'
end
