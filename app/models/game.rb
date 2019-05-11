class Game < ApplicationRecord
  belongs_to :match
  belongs_to :player_1, foreign_key: 'player_1_id', class_name: Player
  belongs_to :player_2, foreign_key: 'player_2_id', class_name: Player
end
