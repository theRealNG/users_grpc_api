class UsersApiServer < UsersApi::Service
  def get_user(user_request, _unused_call)
    user = User.where(email: user_request.email).first
    UserResponse.new(first_name: user.first_name,
                     last_name: user.last_name,
                     email: user.email)
  end
end
