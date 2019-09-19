class Mypage::IdentificationController < ApplicationController

  def edit
    @user = User.find(current_user.id)
  end

  def update

  end

  private
  def identification_params

  end
end