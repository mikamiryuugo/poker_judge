class Poker < ApplicationRecord
  validates :card_in_hand, presence: true


  def check_format
    # 正規表現　この中で大体のエラーを防げそうかな。
    # cards.~~~
  end

  def one_pair
    cards = self.split
    cards.map! {|card| card.slice[0]}
    cards.uniq.count == 3
  end

  def two_pair
  end

  def three_card
  end

  def four_card
  end

  def full_house
  end

  def flash
  end

  def straight
  end

  def straight_flash
  end

  def loyel_straight_flash
  end

end
