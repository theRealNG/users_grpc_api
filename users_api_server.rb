class UsersApiServer < UsersApi::Service
  def get_user(user_request, _unused_call)
    user = User.where(email: user_request.email).first
    UserResponse.new(name: user.full_name,
                     email: user.email)
  end
end
