class ApplicationController < ActionController::API
  before_action :set_raven_context
  before_action :authenticate_request

  attr_reader :current_user

  private

  def authenticate_request
    @current_user = Authorisation::RequestAuthorisation.call(request.headers).result
    render json: { error: 'User not authorised'}, status: :unauthorized unless @current_user
  end

  def set_raven_context
    #user may be trying to authenticate
    Raven.user_context(id: @current_user.id) if @current_user
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
