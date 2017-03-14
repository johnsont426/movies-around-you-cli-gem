# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'movies_around_you/version'

Gem::Specification.new do |spec|
  spec.name          = "movies_around_you"
  spec.version       = MoviesAroundYou::VERSION
  spec.authors       = ["Johnson Tai"]
  spec.email         = ["johnsont426@gmail.com"]

  spec.summary       = %q{Finds movies around you.}
  spec.description   = %q{Finds movies available in theaters around you by simply type in your zip.}
  spec.homepage      = "https://github.com/johnsont426/movies-around-you-cli-gem"
  spec.license       = "MIT"
  
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri"
end
