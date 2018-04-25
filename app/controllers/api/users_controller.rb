module Api
  class UsersController < ApplicationController
    skip_before_action :authenticate_request, only: %i(create)

    def create
      new_user = CreateUserRequest.new(params).create
      head :created, location: "/api/users/#{new_user.id}"
    end

    def update
      user = User.last
      UpdateUserRequest.new(params,user).update
      head :no_content
    end
  end
end
