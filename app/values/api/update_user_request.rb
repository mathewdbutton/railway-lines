module Api
  class UpdateUserRequest

    def initialize(params, user)
      @user = user
      @safe_params = params.permit(:name,:email,:password)
    end

    def update
      @user.update(@safe_params)
    end

  end
end