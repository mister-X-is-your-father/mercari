class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]

  def new
  end


  def show
  end

  def edit
  end

  def update
    if @user.id == current_user.id
    @user.update(user_params)
    redirect_to mypage_edit_identification_path
    else
      redirect_to root_path
    end
  end

  def create_address
  end

  def profile
  end

  def set_user
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(
      :postal_code,
      :region,
      :city,
      :block,
      :buildings
      )
  end

end
