# frozen_string_literal: true

class DoublesTeam < Team
  has_many :player_teams, dependent: :destroy
  has_many :players, through: :player_teams
end
