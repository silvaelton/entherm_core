$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "financial/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "financial"
  s.version     = Financial::VERSION
  s.authors     = ["elton silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Financial."
  s.description = "TODO: Description of Financial."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
