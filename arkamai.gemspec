  Gem::Specification.new do |gem|
  gem.name          = 'arkamai'
  gem.version       = '0.0.1'
  gem.authors       = ["Martin Ramos Mejia"]
  gem.email         = 'ramosmejiamartin@gmail.com'
  gem.homepage      = 'https://github.com/idontdomath/arkamai'
  gem.summary       = "a small command line akamai toolkit"
  gem.description   = "a small akamai toolkit for the command-line, allowing to check information of urls and cache-keys"

  gem.files         = Dir[
                        "LICENSE",
                        "README.md",
                        "Rakefile",
                        "bin/*",
                        "lib/**/*.rb",
                        "lib/**/*/*.rb",
                        "*.gemspec",
                        "test/*.*"
                      ]

  gem.executables   = "arkamai"
  gem.name          = "arkamai"
  gem.require_paths = ["lib"]
  gem.license = "LICENSE"

  gem.add_dependency 'choice'
end