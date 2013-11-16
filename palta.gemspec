# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'palta/version'

Gem::Specification.new do |spec|
  spec.name          = "palta"
  spec.version       = Palta::VERSION
  spec.authors       = ["Ignacio Contreras Pinilla"]
  spec.email         = ["ignacio@ignacio.cat"]
  spec.description   = %q{Simple server for simple (remote) logging}
  spec.summary       = %q{Simple Ruby server made for logging remote messages and triggering actions according to customizable criteria}
  spec.homepage      = "http://github.com/ignc/palta"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
