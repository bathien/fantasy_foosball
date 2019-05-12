# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'player validation' do
    it 'create valid' do
      player = build(:player)
      expect(player).to be_valid
    end

    it 'not valid when missing first_name' do
      player = build(:player, first_name: nil)
      expect(player).not_to be_valid
    end

    it 'not valid when missing last name' do
      player = build(:player, last_name: nil)
      expect(player).not_to be_valid
    end
  end
end
