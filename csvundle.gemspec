# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'csvundle/version'

Gem::Specification.new do |spec|
  spec.name          = "csvundle"
  spec.version       = CSVundle::VERSION
  spec.authors       = ["Robert Grayson", "Jonah Ruiz"]
  spec.email         = ["bobbygrayson@gmail.com", "jonah@pixelhipsters.com"]

  spec.summary       = %q{To package csvs for access terminal.}
  spec.description   = %q{A WIP gem to package csvs for access terminal.}
  spec.homepage      = "https://github.com/accessterminal/CSVundle"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.2.1'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
