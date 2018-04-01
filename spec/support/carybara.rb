Capybara.configure do |config|
  config.match = :prefer_exact
  config.javascript_driver = :poltergeist
end
