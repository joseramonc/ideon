class Api::UsersController < Api::ApplicationController

  skip_before_action :authenticate_with_token, only: :create

  before_action :set_user, only: [:update, :destroy]

  def create
    @user = User.new(user_params)
    
    unless @user.save
      render json: @user.errors, status: :unprocessable_entity
    end

    @user.ensure_or_generate_token
  end

  def update
    unless @user.update(user_params)
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :ok
  end

private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
