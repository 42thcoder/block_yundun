# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "block_yundun/version"

Gem::Specification.new do |spec|
  spec.name          = "block_yundun"
  spec.version       = BlockYundun::VERSION
  spec.authors       = ["yunzheng"]
  spec.email         = ["zhangyunzheng@gmail.com"]

  spec.summary       = %q{Rack middleware to block requests issued by yundun}
  spec.description   = %q{无可奉告}
  spec.homepage      = "http://hackerzhang.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]




  spec.add_runtime_dependency "rack",    ">=1.0.0"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'capybara', '~>2.3.0'
  spec.add_development_dependency 'selenium-webdriver', '2.44.0'
  spec.add_development_dependency 'rails', '>=4.0.0'
  spec.add_development_dependency 'codecov'
end
