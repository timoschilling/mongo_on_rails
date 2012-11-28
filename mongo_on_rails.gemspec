# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongo_on_rails/version'

Gem::Specification.new do |gem|
  gem.name          = "mongo_on_rails"
  gem.version       = MongoOnRails::VERSION
  gem.authors       = ["Timo Schilling"]
  gem.email         = ["timo@schilling.io"]
  gem.description   = "Mongo Railtie Logging Adapter"
  gem.summary       = "A Rails Railtie that use the Mongo Instrumenter API to log the Mongo runtime into the Rails Controller Runtime Logger like `Completed 200 OK in 31ms (Views: 23.1ms | Mongo: 3.2ms)`."
  gem.homepage      = "https://github.com/timoschilling/mongo_on_rails"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "mongo", "~> 1.8"
end
