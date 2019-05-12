# frozen_string_literal: true

class Match < ApplicationRecord
  has_many :games, dependent: :destroy

  belongs_to :team_1,
             foreign_key: 'team_1_id',
             class_name: 'Team', inverse_of: :matches

  belongs_to :team_2,
             foreign_key: 'team_2_id',
             class_name: 'Team', inverse_of: :matches

  validates :team_1, :team_2, presence: true
end
