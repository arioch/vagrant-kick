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
  gem.name = "vagrant-kick"
  gem.homepage = "https://github.com/arioch/vagrant-kick"
  gem.license = "GPL2"
  gem.summary = %Q{Vagrant plugin to kick off tests}
  gem.description = %Q{Vagrant plugin to kick off a bunch of predefined tests}
  gem.email = "tom@penumbra.be"
  gem.authors = ["Tom De Vylder"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new
