# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'check validation on model' do
    it 'has a valid factory' do
      expect(build(:match)).to be_valid
    end
    it 'is invalid without a team_1' do
      expect(build(:match, team_1: nil)).not_to be_valid
    end
    it 'is invalid without a team_2' do
      expect(build(:match, team_2: nil)).not_to be_valid
    end
  end
end
