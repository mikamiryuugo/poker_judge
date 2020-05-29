class AddColumnCardStrength < ActiveRecord::Migration[6.0]
  def change
    add_column :pokers, :card_strength, :string
  end
end
