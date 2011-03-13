# config/initializers/setup_mail.rb
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "savouries.ca",
  :user_name            => "jscchiu",
  :password             => "boomja888",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"

