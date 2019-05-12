# frozen_string_literal: true

class SinglesTeam < Team
  has_one :player_team, dependent: :destroy
  has_one :player, through: :player_team
end
