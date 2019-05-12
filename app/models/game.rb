# frozen_string_literal: true

class Game < ApplicationRecord
  enum status: %w[pending completed cancelled]
  belongs_to :match

  delegate :team_1_id, :team_2_id, to: :match
  before_validation :set_default_status
  before_validation :set_winner_team_when_completed, if: -> { completed? }
  after_create :update_match_winner

  validates :team_1_score, :team_2_score,
            numericality: { greater_than_or_equal_to: 0,
                            less_than_or_equal_to: 10,
                            allow_nil: true }
  validates :match_id, presence: true
  validates :winner_team_id, :team_1_score, :team_2_score,
            presence: true, if: -> { completed? }
  validates :winner_team_id, :team_1_score, :team_2_score,
            absence: true, if: -> { !completed? }

  validate :game_data_cant_change_if_completed, on: :update, if: :completed?
  validate :score_cant_not_be_draw, if: :completed?

  private

  def update_match_winner
    match_winner_team_id =
      Game.where(match_id: match_id)
          .group(:winner_team_id)
          .having('count(winner_team_id) >= 2')
          .select(:winner_team_id)
    return unless match_winner_team_id

    Match.find(match_id).update!(winner_team_id: match_winner_team_id)
  end

  def game_data_cant_change_if_completed
    errors.add(:base, "can't change data of completed game")
  end

  def set_default_status
    self.status = Game.statuses[:pending] unless status
  end

  def set_winner_team_when_completed
    self.winner_team_id =
      team_1_score.to_i > team_2_score.to_i ? team_1_id : team_2_id
  end

  def score_cant_not_be_draw
    errors.add(:base, 'game score can not be draw') if team_1_score == team_2_score
  end
end
