# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
test = File.expand_path('../test', __FILE__)
config = File.expand_path('../config', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'britecore_printer/version'

Gem::Specification.new do |spec|
  spec.name          = "britecore_printer"
  spec.version       = BritecorePrinter::VERSION
  spec.authors       = ["Kevin Russell"]
  spec.email         = ["russellkt@gmail.com"]

  spec.summary       = %q{Gem designed to take Britecore documents from dropbox sync and print in diff order}
  spec.homepage      = "https://github.com/russellkt/britecore_printer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = ["print"]
  spec.require_paths = ["lib","test","config"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
