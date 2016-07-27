require 'yaml'
require 'grpc'
require 'bundler'
Bundler.require

Dir["./models/*.rb"].each {|file| require file }
#Dir["./lib/*.rb"].each {|file| require file }
#require_relative "../users_api_server"

environment = ENV.fetch('RACK_ENV') { 'development' }
db_options = YAML.load(File.read('./config/database.yml'))[environment]
ActiveRecord::Base.establish_connection(db_options)
