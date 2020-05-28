class CreatePokers < ActiveRecord::Migration[6.0]
  def change
    create_table :pokers do |t|
      t.string :card_in_hand

      t.timestamps
    end
  end
end
