class Api::PokerController < ApplicationController
  def judge

    cards = Poker.new(poker_params)

    render json: cards.errors.full_messages and return unless cards.valid?

    # cards.one_pair
    render json: cards

    # なんの答えかをだすロジック作るのみかな。

  end


private

  def poker_params
    params.require(:poker).permit(:card_in_hand)
  end




end
