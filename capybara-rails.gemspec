# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capybara-rails/version'

Gem::Specification.new do |spec|
  spec.name          = "capybara-rails"
  spec.version       = Capybara::Rails::VERSION
  spec.authors       = ["Kirill Mokevnin"]
  spec.email         = ["mokevnin@gmail.com"]
  spec.description   = %q{capybara for rails}
  spec.summary       = %q{capybara for rails}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "capybara"
  spec.add_runtime_dependency "capybara-console"
  spec.add_runtime_dependency "exception_notification"
  spec.add_runtime_dependency "database_cleaner"
end
