class Poker < ApplicationRecord
  validates :card_in_hand, presence: true
  validate :check_cards_count


  def check_format
    # 正規表現
    # cards.~~~
  end

end
