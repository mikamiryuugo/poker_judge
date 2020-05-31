class Poker < ApplicationRecord
  validates :card_in_hand, presence: true
  validates :card_in_hand, format: { with: /\A([^\s\p{blank}]+ ){4}[^\s\p{blank}]+\z/, message: "フォーマットが正しくありません。" }
    # 半角英数字（大文字含む11文字）
    # REG_HANKAKU_EISU_11_CHAR_CAPITAL = Regexp.new(/\A[a-zA-Z0-9]{11}\z/)


  def judgement_time
  # この中にポーカーの役をまとめる
    one_pair
    two_pair
    three_card
    four_card
    full_house
    flaaash
    straight
    straight_flash
    loyel_straight_flash
  end


  def one_pair
    cards = judge_cards
    self.card_strength = "1ペア" if cards.values.count == 4
  end

  def two_pair
    cards = judge_cards
    self.card_strength = "2ペア" if cards.values.exclude?(3) && cards.values.count == 3
  end

  def three_card
    cards = judge_cards
    self.card_strength = "3カード" if cards.values.include?(3) && cards.values.count == 3
  end

  def four_card
    cards = judge_cards
    self.card_strength = "4カード" if cards.values.include?(4)
  end

  def full_house
    cards = judge_cards
    self.card_strength = "フルハウス" if cards.values.include?(3) && cards.values.include?(2)
  end

  def flaaash
    self.card_strength = "フラッシュ" if flash?
  end

  def straight
    self.card_strength = "ストレート" if straight?
  end

  def straight_flash
    self.card_strength = "ストレートフラッシュ" if straight? && flash?
  end

  def loyel_straight_flash
    self.card_strength = "ロイヤルストレートフラッシュ" if loyel_straight? && flash?
  end


  def judge_cards
    cards = self.card_in_hand.delete("^0-9| ").split.map(&:to_i)
    cards = cards.group_by(&:itself).transform_values(&:size)
  end

  def flash?
    cards = self.card_in_hand.split
    cards.map! {|card| card.slice!(0) }
    cards.uniq.count == 1
  end

  def straight?
    cards = self.card_in_hand.delete("^0-9| ").split.map(&:to_i)
    cards.sort[1] == cards.sort[0] +1 && cards.sort[2] == cards.sort[0] + 2 && cards.sort[3] == cards.sort[0] +3 && cards.sort[4] == cards.sort[0] + 4 || cards.sort == [1,10,11,12,13]
  end

  def loyel_straight?
    cards = self.card_in_hand.delete("^0-9| ").split.map(&:to_i)
    cards.sort == [1,10,11,12,13]
  end

end
