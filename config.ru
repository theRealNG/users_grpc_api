$:.unshift File.expand_path("./../lib", __FILE__)

require 'bundler'
Bundler.require

require './config/environment'

# connection managment so that connection doesn't stay open when requests are finished
use ActiveRecord::ConnectionAdapters::ConnectionManagement
