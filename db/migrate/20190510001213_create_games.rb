# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :match, foreign_key: true
      t.references :winner_team, foreign_key: { to_table: :teams }, index: true
      t.integer :team_1_score
      t.integer :team_2_score
      t.integer :status
      t.timestamps
    end
  end
end
