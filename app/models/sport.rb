class Sport < ApplicationRecord
    has_many :athlete_sports
    has_many :athletes, through: :athlete_sports
end
