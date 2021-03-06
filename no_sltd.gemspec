# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'no_sltd/version'

Gem::Specification.new do |spec|
  spec.name          = "no_sltd"
  spec.version       = NoSLTD::VERSION
  spec.authors       = ["tompng"]
  spec.email         = ["tomoyapenguin@gmail.com"]

  spec.summary       = %q{Simple way to avoid stack level too deep}
  spec.description   = %q{Provides a simple way to avoid stack level too deep for recursive functions}
  spec.homepage      = "https://github.com/tompng/no_sltd"
  spec.license       = "MIT"
  spec.required_ruby_version = '>= 2.1.0'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
