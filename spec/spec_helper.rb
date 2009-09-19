require 'rubygems'
gem 'rspec'
require 'spec'
require 'spec/autorun'

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'cucumber'
$:.unshift(File.dirname(__FILE__))
