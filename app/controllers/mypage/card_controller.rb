class Mypage::CardController < ApplicationController
  require 'payjp'

  def new
    @card = Card.where(user_id: current_user.id)
    redirect_to mypage_card_path(@card.ids) if @card.exists?
  end

  def pay
    Payjp.api_key = Rails.application.credentials.PAYJP_PRIVATE_KEY
    if params['payjp-token'].blank?
      redirect_to new_mypage_card_path
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to mypage_card_path(@card.id)
      else
        redirect_to mypage_pay_card_path
      end
    end
  end

  def destroy
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials.PAYJP_PRIVATE_KEY
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to new_mypage_card_path
  end

  def show
    @card = Card.where(user_id: current_user.id).first
    if @card.blank?
      redirect_to new_mypage_card_path
    else
      Payjp.api_key = Rails.application.credentials.PAYJP_PRIVATE_KEY
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end
end