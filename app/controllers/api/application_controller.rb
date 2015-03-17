module Api
  class ApplicationController < ActionController::Base
    before_action :authenticate_with_token

    protected

    def authenticate_with_token
      auth_token = request.headers["Authorization"]
      if auth_token && user = User.find_by_auth_token(auth_token)
        sign_in(:user, user)
      else
        head :unauthorized
      end
    end
  end
end
