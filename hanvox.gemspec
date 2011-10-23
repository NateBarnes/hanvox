require File.expand_path("../lib/hanvox/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "hanvox"
  s.version     = Hanvox::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author     = "Nathaniel Barnes"
  s.email       = ["nathaniel.r.barnes@gmail.com"]
  s.homepage    = "http://github.com/natebarnes/hanvox"
  s.summary     = "A signature audio procesing library"
  s.description = "Hanvox is an audio processing library used to find specific signatures within audio. It was developed as part of the wardialer AT-5001, and is primarily used to analyze call audio"

  s.required_rubygems_version = ">= 1.3.6"

  # lol - required for validation
  s.rubyforge_project         = "hanvox"

  # If you have other dependencies, add them here
  # s.add_dependency "another", "~> 1.2"

  # If you need to check in files that aren't .rb files, add them here
  s.files        = Dir["{lib}/**/*.rb", "ext/**/*.*", "bin/*", "LICENSE", "README", "ROADMAP", "CHANGELOG"]
  s.require_path = 'lib'

  # If you need an executable, add it here
  # s.executables = ["newgem"]

  # If you have C extensions, uncomment this line
  s.extensions = "ext/kissfft/extconf.rb"
end