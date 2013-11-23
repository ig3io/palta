require "bundler/gem_tasks"
require "rdoc/task"
require "rake/testtask"

RDoc::Task.new do |rdoc|
  rdoc.main = "README.md"
  rdoc.rdoc_files.include("README.md", "lib /*.rb", "bin/palta.rb")
end

Rake::TestTask.new do |test|
  test.libs << "test"
end

task :default => [:test]
