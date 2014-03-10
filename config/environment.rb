# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Blog::Application.initialize!

ActionMailer::Base.smtp_settings = {
      :enable_starttls_auto => true,
      :address => "smtp.gmail.com",
      :port => 587,
      :domain => "google.com",
      :authentication => :plain,
      :user_name => "mayuri.icicle@gmail.com",
      :password => "mayuri23"
    }
