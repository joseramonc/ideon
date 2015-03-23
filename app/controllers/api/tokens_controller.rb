class Api::TokensController < ActionController::Base

  def create
    @user = User.find_by_email(params[:email])
    if  @user && @user.valid_password?(params[:password])
      @user.ensure_or_generate_token
    else
      head :unauthorized
    end
  end

end
