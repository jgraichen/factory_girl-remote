# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'factory_girl/remote/version'

Gem::Specification.new do |spec|
  spec.name          = 'factory_girl-remote'
  spec.version       = FactoryGirl::Remote::VERSION
  spec.authors       = ['Jan Graichen']
  spec.email         = %w(jg@altimos.de)
  spec.summary       = %q{Remotely call FactoryGirl factories.}
  spec.description   = %q{Remotely call FactoryGirl factories.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_dependency 'rack-remote'
  spec.add_dependency 'factory_girl'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
