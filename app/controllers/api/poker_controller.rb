class Api::PokerController < ApplicationController
  def judge
    cards = Poker.new(params[:card_in_hand])

    # render json: cards.errors.full_messages.to_json and return unless cards.valid?

    render json: cards
  end
end
