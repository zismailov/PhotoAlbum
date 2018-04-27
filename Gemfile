source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "active_link_to"
gem "autoprefixer-rails"
gem "coffee-rails", "~> 4.2"
gem "decent_exposure"
gem "devise"
gem "foreman"
gem "foundation-rails"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.6"
gem "sass-rails", "~> 5.0"
gem "sidekiq"
gem "simple_form"
gem "sinatra", require: nil
gem "slim"
gem "uglifier", ">= 1.3.0"

# monitoring
gem "rollbar"

# picture management
gem "aws-sdk", "~> 3"
gem "carrierwave-aws"
gem "mini_magick"
gem "s3_direct_upload"

group :development, :test do
  gem "brakeman", require: false
  gem "bundler-audit"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "pry"
  gem "rails_best_practices"
  gem "rspec-rails", "~> 3.7"
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
  gem "scss_lint", require: false
end

group :test do
  gem "capybara", "~> 2.13"
  gem "codeclimate-test-reporter", require: nil
  gem "database_cleaner"
  gem "email_spec"
  gem "formulaic"
  gem "launchy"
  gem "poltergeist"
  gem "shoulda-matchers", "~> 3.1"
end

group :development do
  gem "letter_opener"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
end
