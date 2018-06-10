
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "buschtelefon/version"

Gem::Specification.new do |spec|
  spec.name          = "buschtelefon"
  spec.version       = Buschtelefon::VERSION
  spec.authors       = ["Josua Schmid"]
  spec.email         = ["josua.schmid@renuo.ch"]

  spec.summary       = %q{Library for meshnet gossip}
  spec.description   = %q{Buschtelefon can be used to share information in a between Tuby clients over a network}
  spec.homepage      = "https://github.com/schmijos/buschtelefon"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "cucumber", "~> 3.0"
  spec.add_development_dependency "factory_bot", "~> 4.0"
end
