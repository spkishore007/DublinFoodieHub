source 'https://rubygems.org'
ruby '2.3.1'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'lazy_high_charts'
gem 'pizza_chart', '~> 2.0.4'
gem 'rails_admin'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'graph_decorator'
gem 'medical_strategy'
gem 'pricing_observer'
gem 'product_home_template'
gem 'product_update_single'
gem 'sales_and_orders_decorator'

gem 'erubis'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.0.beta1'
# Use sqlite3 as the database for Active Record
gem 'devise', '~> 4.2'
gem 'awesome_print', '~> 1.7'
gem 'pundit', '~> 1.1'
gem 'pry', '~> 0.10.4'
gem 'brakeman', '~> 3.4', '>= 3.4.1'
gem 'simple_form', '~> 3.4'
gem 'better_errors', '~> 2.1', '>= 2.1.1'
gem 'will_paginate', '~> 3.1', '>= 3.1.5'
gem 'bootstrap-will_paginate', '~> 0.0.11'
gem 'rails-observers', github: 'rails/rails-observers'
gem 'activeresource', github: 'rails/activeresource'
gem 'sqlite3'
gem 'pg', '~> 0.20.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', github: "rails/sass-rails"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
 
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'minitest-rails-capybara'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.7.0'
  gem 'selenium-webdriver'
 gem 'minitest-reporters', '~> 1.1', '>= 1.1.14'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
group :production do
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
