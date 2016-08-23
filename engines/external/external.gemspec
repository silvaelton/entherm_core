$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "external/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "external"
  s.version     = External::VERSION
  s.authors     = ["elton silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of External."
  s.description = "TODO: Description of External."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end