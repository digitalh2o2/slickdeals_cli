# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slickdeals_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "slickdeals_cli"
  spec.version       = SlickdealsCli::VERSION
  spec.authors       = ["Saul Ocampo"]
  spec.email         = ["digitalh2o@gmail.com"]

  spec.summary       = "Scrapes the Popular Deals page on Slickdeals and Deal of the Day on Woot.com"
  spec.description   = "Provides the url and price for Woot and Slickdeal Popular Deals."
  spec.homepage      = "https://rubygems.org/gems/slickdeals_cli"
  spec.license       = "MIT"

  spec.files         = "['lib/slickdeals_cli/cli.rb', 'lib/slickdeals_cli/deal.rb', 'lib/slickdeals_cli/popular.rb', 'lib/slickdeals_cli/version.rb', 'lib/slickdeals_cli.rb']"
  spec.bindir        = "bin"
  spec.executables   = "slickdeals_cli"
  spec.require_paths = ["lib", "lib/slickdeals_cli.rb"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "colorize", "~>0.7.7"

  spec.add_dependency "nokogiri"
end
