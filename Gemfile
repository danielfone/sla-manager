source 'https://rubygems.org'

ruby File.read('.ruby-version')

gem 'rails', '4.1.6'
gem 'pg'
gem 'rails_12factor'
gem 'puma', '~> 2.9.1'

# Assets
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'bootstrap_form'
gem 'rails_bootstrap_navbar'

gem 'jbuilder', '~> 2.0'
gem 'newrelic_rpm'

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'guard-bundler'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.1.0', require: false
  gem 'rspec', '~> 3.1.0', require: false
end

group :test do
  gem 'simplecov', require: false
  gem 'capybara'
end
