class UserReviewsController < ApplicationController
  def index
    @user_reviews = User_review.includes(:user).page(params[:page]).per(10).order("created_at DESC")
  end

  def create
    @user_review = user_review.create(user_review_params)
  end


  private
  def user_review_params
    params.require(:user_review).permit(:rate, :comment).merge(user_id: current_user.id)
  end
end
