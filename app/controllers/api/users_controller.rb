module Api
  class UsersController < ApplicationController
    skip_before_action :authenticate_request

    def create
      new_user = CreateUserRequest.new(params).create
      head :created, location: "/api/users/#{new_user.id}"
    end
  end
end
