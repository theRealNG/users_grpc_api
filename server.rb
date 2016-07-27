$: << File.join(File.dirname(__FILE__), "lib")

require 'grpc'
require 'users_api_services'
require './config/environment'

class UsersApiServer < UsersApi::Service
  def get_user(user_request, _unused_call)
    user = User.where(email: user_request.email).first
    UserResponse.new(first_name: user.first_name,
                     last_name: user.last_name,
                     email: user.email)
  end
end

s = GRPC::RpcServer.new
s.add_http2_port("0.0.0.0:50052", :this_port_is_insecure)
s.handle(UsersApiServer)
s.run_till_terminated
