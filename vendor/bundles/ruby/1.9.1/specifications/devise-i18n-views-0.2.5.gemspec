# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "devise-i18n-views"
  s.version = "0.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["mcasimir"]
  s.date = "2012-12-06"
  s.description = "I18n support for devise views"
  s.email = "maurizio.cas@gmail.com"
  s.extra_rdoc_files = ["LICENSE.txt", "README.md"]
  s.files = ["LICENSE.txt", "README.md"]
  s.homepage = "http://github.com/mcasimir/devise-i18n-views"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "I18n support for devise views"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 2.4.0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.3"])
      s.add_development_dependency(%q<i18n-spec>, [">= 0"])
      s.add_development_dependency(%q<localeapp>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 2.4.0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
      s.add_dependency(%q<i18n-spec>, [">= 0"])
      s.add_dependency(%q<localeapp>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 2.4.0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
    s.add_dependency(%q<i18n-spec>, [">= 0"])
    s.add_dependency(%q<localeapp>, [">= 0"])
  end
end
