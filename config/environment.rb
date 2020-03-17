# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
  # Settings specified here will take precedence over those in 
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 } #<-追記
end