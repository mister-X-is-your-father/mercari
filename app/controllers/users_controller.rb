class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]

  def new
  end


  def show
    # @user = User.find(params[:id])
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

  def card#表示用に追加（森田）
  end

  def card2#表示用に追加（森田）
  end

  def card3#表示用に追加（森田）
  end

  def login#表示用に追加（森田）
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
