begin
  require 'vagrant-foobar'
rescue LoadError
  require 'rubygems'
  require 'vagrant-foobar'
end
