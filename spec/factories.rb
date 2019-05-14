# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
  end

  factory :team do
    name { FFaker::Internet.user_name }
    players {FactoryBot.create_list(:player, 2)}
  end

  factory :match do
    association :team_1, factory: :team
    association :team_2, factory: :team
  end

  factory :game do
    association :match
  end
end
