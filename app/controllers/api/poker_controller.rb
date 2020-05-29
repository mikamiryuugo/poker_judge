module api
  class PokerController < ApplicationController

    def index
    end

    def judge
      cards = Poker.new(params[:card_in_hand])
      cards.valid?

      render json
    end


  end
end