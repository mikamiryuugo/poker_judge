class Poker < ApplicationRecord
  validates :card_in_hand, presence: true


  def check_format
    # 正規表現
    # cards.~~~
  end

end
