# frozen_string_literal: true

class Player < ApplicationRecord
  has_many :player_teams, dependent: :restrict_with_exception
  has_many :teams, through: :player_teams

  validates :first_name, :last_name, presence: true
end
