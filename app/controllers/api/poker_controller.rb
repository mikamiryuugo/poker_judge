class Api::PokerController < ApplicationController
  def judge

    cards = Poker.new(poker_params)

    render json: cards.errors.full_messages and return unless cards.valid?

    cards.judgementtime

    render json: cards

  end

private

  def poker_params
    params.require(:poker).permit(:card_in_hand)
  end

end
