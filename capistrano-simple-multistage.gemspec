# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = "capistrano-simple-multistage"
  gem.version       = "0.1.0"
  gem.authors       = ["Matt Mihic"]
  gem.email         = ["matt@mpath.com"]
  gem.homepage      = "https://github.com/mpath-development/capistrano-simple-multistage"
  gem.summary       = %q{Simple multistage support for Capistrano}
  gem.description   = %q{Provides simple support for deploying to multiple environments}

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('capistrano', '~> 2.15.5')
end
