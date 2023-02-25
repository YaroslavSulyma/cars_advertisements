source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.4', '>= 7.0.4.2'

gem 'bootsnap', '~> 1.16.0', require: false
gem 'devise', '~> 4.9.0'
gem 'devise-i18n', '~>1.11.0'
gem 'dotenv-rails', '~> 2.8.1'
gem 'pagy', '~> 6.0.1'
gem 'pg', '~> 1.4.5'
gem 'puma', '~> 6.0.2'
gem 'slim-rails', '~> 3.5.1'
gem 'sprockets-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'faker', '~>3.1.1'
  gem 'pry', '~>0.14.2'
end

group :development do
  gem 'bullet', '~>7.0.3'
  gem 'bundler-audit', '~> 0.9.1', require: false
  gem 'bundler-leak', '~> 0.3.0', require: false
  gem 'fasterer', '~> 0.10.0', require: false
  gem 'lefthook', '~> 1.2.8', require: false
  gem 'rubocop', '~>1.44.1', require: false
  gem 'rubocop-i18n', '~> 3.0', require: false
  gem 'rubocop-md', '~> 1.1', require: false
  gem 'rubocop-performance', '~>1.15.2', require: false
  gem 'rubocop-rails', '~> 2.17.4', require: false
  gem 'rubocop-rake', '~> 0.6.0', require: false
  gem 'web-console', '~>4.2.0'
end

group :test do
  gem 'rspec-rails', '6.0.1'
end
