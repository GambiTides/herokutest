Rails3BootstrapDeviseCancan::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment, code is reloaded on every request. 
  # This slows down response time but is perfect for development
  # sp don't have to restart the web server when making code changes.
  config.cache_classes = false

  # Log error messages when accidentally calling methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # ActionMailer Config
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.action_mailer.delivery_method =  :smtp
  # change to allow email to be sent during development
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"

  ActionMailer::Base.smtp_settings = {
      :address        => "smtp.mail.yahoo.com",
      :port           => 587,
      :authentication => :plain,
      :user_name      => "flutracker@ymail.com",
      :password       => "ruby2012",
      :openssl_verify_mode  => 'none'
  } 


  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (for SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
end
