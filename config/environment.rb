require 'yaml'
require 'bundler'
Bundler.require

Dir["./models/*.rb"].each {|file| require file }
Dir["./lib/*.rb"].each {|file| require file }

environment = ENV.fetch('RACK_ENV') { 'development' }
db_options = YAML.load(File.read('./config/database.yml'))[environment]
ActiveRecord::Base.establish_connection(db_options)
