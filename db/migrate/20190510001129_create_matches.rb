# frozen_string_literal: true

class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :team_1, foreign_key: { to_table: :teams }, index: true
      t.references :team_2, foreign_key: { to_table: :teams }, index: true
      t.references :winner_team, foreign_key: { to_table: :teams }, index: true

      t.timestamps
    end
  end
end
