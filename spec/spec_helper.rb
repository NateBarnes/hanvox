$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
$:.unshift File.join(File.dirname(__FILE__), '..', 'ext')

require "bundler"
Bundler.setup

require "rspec"
require "hanvox"
require "kissfft/kissfft"