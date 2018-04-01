source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "coffee-rails", "~> 4.2"
gem "devise"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.6"
gem "sass-rails", "~> 5.0"
gem "slim"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "factory_bot_rails"
  gem "pry"
  gem "rspec-rails", "~> 3.7"
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
end

group :test do
  gem "capybara", "~> 2.13"
  gem "database_cleaner"
  gem "email_spec"
  gem "formulaic"
  gem "poltergeist"
  gem "shoulda-matchers", "~> 3.1"
end

group :development do
  gem "letter_opener"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
end
