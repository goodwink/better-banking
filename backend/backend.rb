require "rubygems"
require "bundler/setup"

require "amqp"
require "em-mongo"
require "active_support/all"
require "yaml"

Dir[File.dirname(__FILE__) + '/lib/model/*.rb'].each {|file| require file }

$config = YAML.load_file(ARGV[0])
