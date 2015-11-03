# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gemsupport/version'

Gem::Specification.new do |spec|
  spec.name          = 'gemsupport'
  spec.version       = Gemsupport::VERSION
  spec.authors       = ['mdouchement']
  spec.email         = ['marc.douchement@predicsis.com']
  spec.summary       = %(q{Add support for gem like activesupport, but without Rails})
  spec.description   = %(q{Add support for gem like activesupport, but without Rails})
  spec.homepage      = 'https://github.com/mdouchement/gemsupport'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%(r{^bin/})) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%(r^(test|spec|features)/}))
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1.0'
  spec.add_development_dependency 'rubocop', '0.20.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'codeclimate-test-reporter'
end
