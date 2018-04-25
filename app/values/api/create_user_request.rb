module Api
  class CreateUserRequest

    def initialize(params)
      @name = params[:name]
      @email = params[:email]
      @password = params[:password]
    end

    def create
      User.create(name: @name,
                  email: @email,
                  password: @password)
    end

  end
end