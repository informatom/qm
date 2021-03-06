source 'https://rubygems.org'

gem 'rails', '3.2.16'                                # latest stable Rails version on 09/06/11
gem 'mysql2'                                         #  database
gem 'devise'                                         # authentification
gem 'devise-i18n-views'                              # translated views for devise
gem 'nokogiri'                                       # Needed by devise-helper

gem 'jquery-rails'                                   # Javascript framework
gem 'jquery-ui-rails'                              # JQuery-UI assets
gem 'cancan'                                         # access control
gem 'ancestry'                                       # hierarchical comments
gem 'simple_form'                                    # simple forms
gem "cocoon", :git => 'git://github.com/nathanvda/cocoon.git'                                      # nested_form_helper
gem 'textile_editor_helper', :git => 'git://github.com/bridgeutopia/textile_editor_helper.git'     # Helper for buttons on textarea
gem 'RedCloth'                                       # textile library
gem 'htmlentities'                                   # requirement of textile_editor_helper, e.g. &auml;
gem "truncate_html"                                  # Für truncate_html
gem 'jquery-datatables-rails'                        # Tables
gem 'carrierwave'                                    # Uploads
gem 'copy_carrierwave_file', github: 'equivalent/copy_carrierwave_file' # for asset-copying between instances
gem 'wicked_pdf'                                     # PDF Creation
gem 'rails3-jquery-autocomplete'                     # autocompletion

# gem 'yaml_db'                                        # for porting database to mysql
gem 'paper_trail', '~> 2'                            # Versioning
gem 'differ'                                         # View diffs
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
                                                     # Twitter Bootstrap for Rails 3.1 Asset Pipeline
gem "less-rails"                                     # Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "font-awesome-rails"                             # Font-awesome integration

group :assets do
  gem 'sass-rails',   '~> 3.2.3'                     # anables SASS in addition to CSS
  gem 'coffee-rails', '~> 3.2.1'                     # enables Coffeescript in addition to Javascript
  gem 'therubyracer', :platforms => :ruby            # serverside Javascript engine
  gem 'uglifier', '>= 1.0.3'                         # Javascript compressor
end

group :test, :development do
  gem 'thin'
  gem 'byebug'                                     # command line debugger
  gem 'simplecov', :require => false                 # code coverage tool
  gem "rspec-rails"                                  # unit test framwork in addition to TestUnit
  gem 'cucumber-rails', :require => false            # BDD framework
  gem 'database_cleaner'                             # addon for databaqse cleaning during tests
  gem "capybara"                                     # Acceptance test framework for web applications
  gem 'email_spec'                                   # rspec matchers and cucumber steps for testing email
  gem "shoulda"                                      # expands rspec matcher, e.g. should validate_uniqueness_of
  gem 'better_errors'                                # Nicer error messages
  gem 'binding_of_caller'                            # Even nicer debugging
  gem "rails-erd"                                    # ER-Diagrams
end
