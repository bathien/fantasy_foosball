class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :match, foreign_key: true
      t.references :player_1, foreign_key: { to_table: :players }, index: true
      t.references :player_2, foreign_key: { to_table: :players }, index: true
      t.integer :player_1_score, default: 0
      t.integer :player_2_score, default: 0
      t.integer :status
      t.timestamps
    end
  end
end
