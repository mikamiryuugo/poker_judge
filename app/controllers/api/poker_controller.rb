class Api::PokerController < ApplicationController

  def index
    @poker = Poker.new
  end

  def judge
    cards = Poker.new(poker_params)

    render json: cards.errors.full_messages and return unless cards.valid?

    cards.correct_card?

    render json: cards.errors.messages[:base] and return if cards.errors.messages[:base].present?

    cards.judgement_time

    render json: cards
  end

private

  def poker_params
    params.require(:poker).permit(:card_in_hand)
  end

end
