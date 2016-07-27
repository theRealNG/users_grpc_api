$: << File.join(File.dirname(__FILE__), "lib")

require './config/environment'
require_relative "./users_api_server"

s = GRPC::RpcServer.new
s.add_http2_port("0.0.0.0:50052", :this_port_is_insecure)
s.handle(UsersApiServer)
s.run_till_terminated
