# -*- encoding: utf-8 -*-
require File.expand_path("../lib/startmobile_sms/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "startmobile_sms"
  s.version     = StartmobileSms::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Pavel Galeta"]
  s.email       = ["superp1987@gmail.com"]
  s.homepage    = "https://github.com/superp/startmobile_sms"
  s.summary     = "A Ruby wrapper for startmobile sms service"
  s.description = "http://bulk.startmobile.com.ua/"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "startmobile_sms"

  s.add_development_dependency "bundler", ">= 1.0.0.rc.6"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
