# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'journal/version'

Gem::Specification.new do |gem|
  gem.name          = "journal"
  gem.version       = Journal::VERSION
  gem.authors       = ["William Myers"]
  gem.email         = ["griffin.myers@gmail.com"]
  gem.description   = %q{A boring utility gem to build my journal website.}
  gem.summary       = %q{It parses Latex to HTML and whatever}

  gem.add_development_dependency "rspec"
  gem.add_runtime_dependency "treetop"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
