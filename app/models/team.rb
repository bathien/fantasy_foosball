# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :matches, dependent: :destroy, inverse_of: :team
end
