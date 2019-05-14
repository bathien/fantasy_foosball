# frozen_string_literal: true

class Team < ApplicationRecord
  PLAYERS_COUNT_MIN = 1
  PLAYERS_COUNT_MAX = 2

  has_many :matches, inverse_of: :team
  has_many :player_teams, dependent: :destroy
  has_many :players, through: :player_teams
  validates :name, presence: true, length: 3..50, uniqueness: true
  validates :players, length: PLAYERS_COUNT_MIN..PLAYERS_COUNT_MAX


  accepts_nested_attributes_for :players, reject_if: :all_blank

end
