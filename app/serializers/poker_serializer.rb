class PokerSerializer < ActiveModel::Serializer
  attributes :id, :card_in_hand, :card_strength
end
