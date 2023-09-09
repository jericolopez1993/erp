source 'https://rubygems.org'

ruby '2.7.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0'

gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 6.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'devise', '~> 4.7'
gem 'cancancan', '~> 3.1'


gem 'administrate'
gem 'administrate-field-paperclip'
gem 'administrate-field-password'
gem 'administrate-field-collection_select'
gem 'administrate-field-hidden', '~> 0.0.3'
gem 'administrate-field-select', '~> 2.0', require: 'administrate/field/select_basic'

gem "paperclip", "~> 6.1"
gem 'seed_dump'
gem 'rack-cors', :require => 'rack/cors'

gem 'bcrypt', '~> 3.1', '>= 3.1.11'
gem 'devise_token_auth'
gem 'roo'
gem 'figaro'
gem 'feathericon-rails'

gem 'fastimage'
gem 'image_processing'
gem 'mini_magick'
gem 'aws-sdk', '~> 3.0'
gem 'font-awesome-sass'
gem 'redis', '~> 3.0'

gem 'cocoon'

# for crm log audits
gem "audited", "~> 4.9"
gem 'summernote-rails', '~> 0.8.10.0'
gem 'country_select', '~> 3.1'
gem 'amoeba'
gem 'friendly_id', '~> 5.3.0'


# global search
gem 'scenic', '~> 1.4'
gem 'textacular', '~> 5.0'

gem 'sdoc'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 3.35'
  gem 'selenium-webdriver'
  gem 'dotenv-rails'
  gem 'annotate'
end


group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'listen', '>= 3.7.0', '< 4.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.1'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby, :truffleruby]

gem "shrine", "~> 3.5"
