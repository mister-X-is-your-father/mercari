class SignupController < ApplicationController

  def index
  end

  def registration
    @user = User.new
  end

  def sms_confirmation
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:kan_familyname] = user_params[:kan_familyname]
    session[:kan_firstname] = user_params[:kan_firstname]
    session[:kana_familyname] = user_params[:kana_familyname]
    session[:kana_firstname] = user_params[:kana_firstname]
    session[:birth_day] = user_params[:birth_day]
    @user = User.new
  end

  def sms_confirmed
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
  end

  def delivery_address
    @user = User.new
  end

  def card
    session[:postal_code] = user_params[:postal_code]
    session[:region] = user_params[:region]
    session[:city] = user_params[:city]
    session[:block] = user_params[:block]
    session[:buildings] = user_params[:buildings]
    session[:address_phone_number] = user_params[:address_phone_number]
    @user = User.new
  end

  def create
    @user = User.create(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      kan_familyname: session[:kan_familyname],
      kan_firstname: session[:kan_firstname],
      kana_familyname: session[:kana_familyname],
      kana_firstname: session[:kana_firstname],
      birth_day: session[:birth_day],
      phone_number: session[:phone_number],
      postal_code: session[:postal_code],
      region: session[:region],
      city: session[:city],
      block: session[:block],
      buildings: session[:buildings],
      address_phone_number: session[:address_phone_number]
    )
    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render '/signup/registration'
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private

    def user_params
      params.require(:user).permit(
        :nickname,
        :email,
        :password,
        :password_confirmation,
        :kan_familyname,
        :kan_firstname,
        :kana_familyname,
        :kana_firstname,
        :birth_day,
        :phone_number,
        :postal_code,
        :region,
        :city,
        :block,
        :buildings,
        :address_phone_number
        )
    end

end
