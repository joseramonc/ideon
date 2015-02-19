module Api
  class ApplicationController < ActionController::Base
    before_action :authenticate_with_token

    protected

    def authenticate_with_token
      if true # User.find_by_token(params[:token]) etc...

      end
    end
  end
end
