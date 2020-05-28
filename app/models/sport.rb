class Sport < ApplicationRecord
    has_many :athletesports
    has_many :athletes, through: :athlete_sports
end
