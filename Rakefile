# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "vagrant-foobar"
  gem.homepage = "http://github.com/arioch/vagrant-foobar"
  gem.license = "GPL2"
  gem.summary = %Q{one-line summary of your gem}
  gem.description = %Q{longer description of your gem}
  gem.email = "tom@penumbra.be"
  gem.authors = ["Tom De Vylder"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new
