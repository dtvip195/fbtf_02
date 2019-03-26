source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.5.3"

gem "bcrypt", "3.1.12"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap", "~> 4.3.1"
gem "cancancan", "~> 2.0"
gem "carrierwave"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "devise"
gem "faker", "~> 1.6", ">= 1.6.3"
gem "font-awesome-sass", "~> 5.6.1"
gem "i18n-js"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.2"
gem "rails-i18n"
gem "ransack"
gem "rubocop", "~> 0.54.0", require: false
gem "sass-rails", "~> 5.0"
gem "to_xls-rails"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "will_paginate-bootstrap4"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "sqlite3", "~> 1.3.13"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end
group :test do
  gem "capybara", ">= 2.15"
  gem "chromedriver-helper"
  gem "selenium-webdriver"
end

group :production do
  gem "fog", "1.42"
  gem "pg"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
