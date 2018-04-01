ActionMailer::Base.instance_eval do
  default from: Rails.application.config.noreply
  default_url_options[:host] = Rails.application.config.host
end
