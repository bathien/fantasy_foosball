# frozen_string_literal: true

class Match < ApplicationRecord
  has_many :games, dependent: :destroy

  belongs_to :team_1,
             foreign_key: 'team_1_id',
             class_name: 'Team', inverse_of: :matches

  belongs_to :team_2,
             foreign_key: 'team_2_id',
             class_name: 'Team', inverse_of: :matches

  belongs_to :winner_team,
             foreign_key: 'winner_team_id',
             class_name: 'Team', inverse_of: :matches, optional: true

  validates :team_1, :team_2, presence: true
  validates :games, length: { maximum: 3 }
  validates :team_1, uniqueness: { scope: :team_2 }
  validates :team_1, exclusion: { in: lambda{ |match| [match.team_2] } }
  validate :match_data_cant_change_if_completed, on: :update

  delegate :name, to: :winner_team, prefix: true
  scope :by_team, lambda{ |team_id| where(team_1_id: team_id).or(where(team_2_id: team_id)) if team_id }
  scope :completed, -> { where.not(winner_team_id: nil) }
  scope :not_completed, -> { where.not(id: completed) }

  private

  def match_data_cant_change_if_completed
    return if winner_team_id_was.nil?

    errors.add(:base, 'Match already completed!') if winner_team_id
  end
end
