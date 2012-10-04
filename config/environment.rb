# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Qm::Application.initialize!

ActionMailer::Base.smtp_settings = {
    :domain => "informatom.com",
    :enable_starttls_auto => false
}
