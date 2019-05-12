# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
  end

  factory :singles_team do
    name { FFaker::Internet.user_name }
  end

  factory :doubles_team do
    name { FFaker::Internet.user_name }
  end

  factory :singles_player_team, class: 'PlayerTeam' do
    association :singles_team
    name { FFaker::Internet.user_name }
    association :player
  end

  factory :doubles_player_team, class: 'PlayerTeam' do
    association :doubles_team
    name { FFaker::Internet.user_name }
    association :player
    association :player
  end

  factory :match do
    association :team_1, factory: :singles_team
    association :team_2, factory: :singles_team
  end

  factory :game do
    association :match
  end
end
