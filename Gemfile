source 'https://rubygems.org'

gem 'rails', '3.2.8'                                 # latest stable Rails version on 09/06/11

gem 'sqlite3'                                        # filebased database
gem 'devise'                                         # authentification
gem 'devise-i18n-views'                              # translated views for devise
gem 'cancan'                                         # access control
gem 'ancestry'                                       # hierarchical comments
gem 'simple_form'                                     # simple forms

group :assets do
  gem 'sass-rails',   '~> 3.2.3'                     # anables SASS in addition to CSS
  gem 'coffee-rails', '~> 3.2.1'                     # enables Coffeescript in addition to Javascript
  gem 'therubyracer', :platforms => :ruby            # serverside Javascript engine
  gem 'uglifier', '>= 1.0.3'                         # Javascript compressor
  gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
                                                     # Twitter Bootstrap for Rails 3.1 Asset Pipeline
end

gem 'jquery-rails'                                   # Javascript framework

group :test, :development do
  gem 'debugger'                                     # command line debugger
  gem 'simplecov', :require => false                 # code coverage tool
  gem "rspec-rails"                                  # unit test framwork in addition to TestUnit
  gem 'cucumber-rails', :require => false            # BDD framework
  gem 'database_cleaner'                             # addon for databaqse cleaning during tests
  gem "capybara"                                     # Acceptance test framework for web applications
  gem 'email_spec'                                   # rspec matchers and cucumber steps for testing email
  gem "shoulda"                                      # expands rspec matcher, e.g. should validate_uniqueness_of
end
