class Api::PokerController < ApplicationController
  def judge
    cards = Poker.new(params[:card_in_hand])
    render json: cards
  end
end
