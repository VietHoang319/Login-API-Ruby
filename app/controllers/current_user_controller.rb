class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(user_password_params)
      render json: {code: 200, message: "Change password sucessfully."}, status: :ok
    else
      render json: :error
    end
  end

  private
    def user_password_params
      params.permit(:current_password, :password, :password_confirmation)
    end
end