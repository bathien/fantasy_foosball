# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'validation game' do
    it 'Game not valid without match' do
      expect(build(:game, match: nil)).not_to be_valid
    end

    it 'game valid without status default pending' do
      game = create(:game)
      expect(game).to be_valid
      expect(game.status).to eq 'pending'
    end

    it 'game complete not valid when not have score and winner team' do
      match = create(:match)
      game1 = build(:game, match: match,
                           team_1_score: 5, team_2_score: nil,
                           status: :completed)
      expect(game1).not_to be_valid
      game2 = build(:game, match: match,
                           team_1_score: nil, team_2_score: 6,
                           status: :completed)
      expect(game2).not_to be_valid
      game = build(:game, match: match, status: :completed)
      game.team_1_score = 0
      game.team_2_score = 10
      expect(game).to be_valid
      expect(game.winner_team_id).to eq match.team_2_id
    end

    it 'not valid game draw' do
      game = build(:game, status: :completed)
      game.team_1_score = 5
      game.team_2_score = 5
      expect(game).not_to be_valid
    end

    it 'game successfully without status default pending' do
      game = create(:game)
      expect(game).to be_valid
      expect(game.status).to eq 'pending'
      expect(game.team_1_score).to eq nil
      expect(game.winner_team_id).to eq nil
    end

    it 'not valid have score when game pending' do
      game = create(:game)
      game.team_1_score = 5
      game.team_2_score = 3
      expect(game).not_to be_valid
    end

    it 'not valid have score when game cancel' do
      game = create(:game, status: :cancelled)
      game.team_1_score = 5
      game.team_2_score = 3
      expect(game).not_to be_valid
    end
  end
end
