# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "startmobile_sms/version"

Gem::Specification.new do |s|
  s.name        = "startmobile_sms"
  s.version     = StartmobileSms::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Pavel Galeta"]
  s.email       = ["superp1987@gmail.com"]
  s.homepage    = "https://github.com/superp/startmobile_sms"
  s.summary     = "A Ruby wrapper for startmobile sms service"
  s.description = "http://bulk.startmobile.com.ua/"

  s.files = Dir["{app,config,db,lib,vendor}/**/*"] + ["Rakefile", "README.rdoc"]

  s.add_development_dependency "bundler", ">= 1.0.0.rc.6"
end
