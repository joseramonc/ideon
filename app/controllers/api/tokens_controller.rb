class Api::TokensController < ActionController::Base

  def create
    if @user = User.find_by_email(params[:email]) && @user.valid_password?(params[:password])
      @user.ensure_or_generate_token
    else
      head :unauthorized
    end
  end

end
