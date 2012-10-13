# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "differ"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pieter van de Bruggen"]
  s.date = "2011-02-17"
  s.email = "pvande@gmail.com"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://github.com/pvande/differ"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "A simple gem for generating string diffs"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
