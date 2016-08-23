$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "purchase/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "purchase"
  s.version     = Purchase::VERSION
  s.authors     = ["elton silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Purchase."
  s.description = "TODO: Description of Purchase."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
