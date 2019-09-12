class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

  end

  def create_address

  end


  private
  def user_params
    # params.require(:user).permit(:)
  end
end
