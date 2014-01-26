$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'arkamai'
  gem.version       = '0.0.1'
  gem.authors       = ["Martin Ramos Mejia"]
  gem.email         = 'ramosmejiamartin@gmail.com'
  gem.homepage      = 'https://github.com/jonlives/ipecache'
  gem.summary       = "small set of useful akamai toolkit"
  gem.description   = "small set of useful akamai toolkit"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'choice'
end