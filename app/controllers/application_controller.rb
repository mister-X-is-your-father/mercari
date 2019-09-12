class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer
    .permit(:sign_up, keys: [
      :nickname,
      :kan_familyname,
      :kan_firstname,
      :kana_familyname,
      :kana_firstname,
      :birth_day,
      :phone_number,
      :avator,
      :profile,
      :point
      ])
  end
end