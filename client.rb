$: << File.join(File.dirname(__FILE__), "lib")

require 'grpc'
require 'users_api_services'

stub = UsersApi::Stub.new("localhost:50052", :this_channel_is_insecure)
user = stub.get_user(UserRequest.new(email:"test@test.com"))
puts "User First Name: #{user.first_name}, Last Name: #{user.last_name}, email: #{user.email}"
