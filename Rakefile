require "bundler"
Bundler.setup

require "rspec/core/rake_task"
Rspec::Core::RakeTask.new(:spec)

gemspec = eval(File.read("newgem.gemspec"))

task :build => "#{gemspec.full_name}.gem"

file "#{gemspec.full_name}.gem" => gemspec.files + ["hanvox.gemspec"] do
  system "gem build hanvox.gemspec"
  system "gem install hanvox-#{Hanvox::VERSION}.gem"
end