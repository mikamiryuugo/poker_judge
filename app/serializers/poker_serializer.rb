class PokerSerializer < ActiveModel::Serializer
  attributes :card_in_hand, :card_strength
end
