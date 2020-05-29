class Sport < ApplicationRecord
    has_many :athlete_sports
    has_many :athletes, through: :athlete_sports
    has_many :coach_sports
    has_many :coaches, through: :coach_sports
end
